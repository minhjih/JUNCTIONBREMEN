from flask import Flask, g, jsonify, request, Blueprint, send_file, Response
import requests
import sqlite3
import chatbotviews
import os
import json
from datetime import datetime, timedelta

# register views
app = Flask(__name__)
app.register_blueprint(chatbotviews.chat_bp)

# DB connection
DATABASE = 'dbmodule/database.db'

def get_db():
    db = getattr(g, '_database', None)
    if db is None:
        db = g._database = sqlite3.connect(DATABASE)
        print("new db connection")
    else:
        print("db connection")
    return db

@app.teardown_appcontext
def close_connection(exception):
    db = getattr(g, '_database', None)
    if db is not None:
        print("db close")
        db.close()

@app.route('/')
def home():
  return 'Hello, this is the home page!'


# get all stores information
@app.route('/storeInfo/', methods = ['GET'])
def get_all_stores():
    cursor = get_db().cursor()
    cursor.execute("SELECT storeName FROM StoreInfo")
    result = cursor.fetchall()
    cursor.close()

    store_names = [row[0] for row in result]
    json_data = json.dumps(store_names, ensure_ascii=False)
    return json_data

# get store description
@app.route('/storeInfo/<storeName>/text', methods = ['GET'])
def get_store_text(storeName):
    cursor = get_db().cursor()
    cursor.execute("SELECT description FROM StoreInfo WHERE storeName=?", (storeName,))
    result = cursor.fetchone()
    cursor.close()

    return json.dumps(result, ensure_ascii=False)

# get store Image
@app.route('/storeInfo/<storeName>/image', methods = ['GET'])
def get_store_image(storeName):
    cursor = get_db().cursor()
    cursor.execute("SELECT storeImageURL \
                   FROM StoreInfo \
                   WHERE storeName=?", (storeName,))
    result = cursor.fetchone()
    cursor.close()

    if result is None or not result[0]:
        return Response(status=204)

    storeImageURL = result[0]
    imagePath = os.path.join(os.path.dirname(__file__), 'static', 'staticdata_stores', storeImageURL)
    if not os.path.exists(imagePath) or os.path.getsize(imagePath) == 0:
        return Response(status=204)

    return send_file(imagePath, mimetype='image/jpeg')

# get all menu names from a store
@app.route('/menuInfo/<storeName>', methods = ['GET'])
def get_all_menu(storeName):
    cursor = get_db().cursor()
    cursor.execute("SELECT menuName \
                   FROM MenuInfo \
                   WHERE storeName=?", (storeName,))
    result = cursor.fetchall()
    cursor.close()

    menu_names = [row[0] for row in result]
    return json.dumps(menu_names, ensure_ascii=False)

# menu info
@app.route('/menuInfo/<storeName>/<menuName>/text', methods = ['GET'])
def get_menu_text(storeName, menuName):
    cursor = get_db().cursor()
    cursor.execute("SELECT menuName, description, kcal, salt, protein, carbohydrate, fat, price \
                   FROM MenuInfo \
                   WHERE storeName=? AND menuName=? AND optionName='default'", (storeName,menuName,))
    result = cursor.fetchone()
    cursor.close()
    menu_info = {
        "menuName": result[0],
        "description": result[1],
        "kcal": result[2],
        "salt": result[3],
        "protein": result[4],
        "carbohydrate": result[5],
        "fat": result[6],
        "price": result[7]
    }
    return json.dumps(menu_info, ensure_ascii=False)

# menu image
@app.route('/menuInfo/<storeName>/<menuName>/image', methods = ['GET'])
def get_menu_image(storeName, menuName):
    cursor = get_db().cursor()
    cursor.execute("SELECT menuImageURL \
                   FROM MenuInfo \
                   WHERE storeName=? AND menuName=?", (storeName,menuName,))
    result = cursor.fetchone()
    cursor.close()

    if result is None or not result[0]:
        return Response(status=204)

    menuImageURL = result[0]
    imagePath = os.path.join(os.path.dirname(__file__), 'static', 'staticdata_menus', menuImageURL)
    if not os.path.exists(imagePath) or os.path.getsize(imagePath) == 0:
        return Response(status=204)

    return send_file(imagePath, mimetype='image/jpeg')

# option group info
@app.route('/menuInfo/<storeName>/<menuName>/options', methods = ['GET'])
def get_menu_options(storeName, menuName):
    cursor = get_db().cursor()
    cursor.execute("""
        SELECT 
            g.groupName,  g.groupType, g.groupMin, g.groupMax,
            o.optionName, 
            m.price,m.kcal,m.salt,m.protein, m.carbohydrate,m.fat
        FROM 
            GroupInfo g
        JOIN 
            MenuOptionInfo o ON g.groupName = o.groupName 
                            AND g.storeName = o.storeName 
                            AND g.menuName = o.menuName
        JOIN 
            MenuInfo m  ON g.storeName = m.storeName 
                        AND g.menuName = m.menuName 
                        AND o.optionName = m.optionName
        WHERE 
            g.storeName = ? AND g.menuName = ?""", (storeName, menuName))
    groups = cursor.fetchall()
    cursor.close()
    group_dict = {}
    for group in groups:
        groupName, groupType, groupMin, groupMax, optionName, price, kcal, salt, protein, carbohydrate, fat = group

        group_text = ""
        if groupType=="checkbox":
            group_text='최소 {0}개부터 {1}개까지 선택해 주세요'.format(groupMin,groupMax)
        else:
            group_text='하나를 선택해 주세요'

        if groupName not in group_dict:
            group_dict[groupName] = {
                "options": [],
                "prices" : [],
                "kcal": [],
                "salt": [],
                "protein": [],
                "carbohydrate": [],
                "fat": [],
                "groupType": groupType,
                "groupText":group_text,
                "groupMin": groupMin,
                "groupMax": groupMax
            }
        
        group_dict[groupName]["options"].append(optionName)
        group_dict[groupName]["prices"].append(price)
        group_dict[groupName]["kcal"].append(kcal)
        group_dict[groupName]["salt"].append(salt)
        group_dict[groupName]["protein"].append(protein)
        group_dict[groupName]["carbohydrate"].append(carbohydrate)
        group_dict[groupName]["fat"].append(fat)

    # JSON으로 반환
    return json.dumps(group_dict, ensure_ascii=False)

# 재현ai적용
@app.route('/imageAI/processImage', methods=['POST'])
def process_image():
    if 'image' not in request.files:
        return 'No image part', 400

    image = request.files['image']

    if image.filename == '':
        return 'No selected file', 400
    
    filepath = os.path.join('tempImage/', image.filename)
    image.save(filepath)
    return run_ai(filepath)

def run_ai(filepath):
    # shoot to localhost
    url = 'http://192.168.101.110:5000/YOLO'
    with open(filepath, 'r') as file:
        files = {'Image': file}
        print("ready to send request")
        response = requests.post(url, files=files)
        print("got response from local server")
    return calc_nutrients(response.json())


# 음식의 구성 성분에 따른 영양성분 얻어오기
# input: "토마토 파스타", output: kcal, salt, protein, carbohydrate, fat
def get_nutrients_info(product_name):
    cursor = get_db().cursor()
    cursor.execute("SELECT kcal, salt, protein, carbohydrate, fat \
                   FROM IngredientInfo \
                   WHERE Ingredient=?", (product_name,))
    result = cursor.fetchone()
    cursor.close()
    return result

# 음식의 구성 성분 부피 목록에 따른 총 영양성분 얻어오기
# input: "토마토 파스타":100, "콜라":150, output: kcal, salt, protein, carbohydrate, fat
def calc_nutrients(data):
    try:
        # data = request.get_json()
        total_kcal = 0
        total_salt = 0
        total_protein = 0
        total_carbo = 0
        total_fat = 0
        for ingredient, volume in data.items():
            nutrient_info = get_nutrients_info(ingredient)
            if nutrient_info:
                kcal, salt, protein, carbohydrate, fat = nutrient_info
                total_kcal += kcal * volume
                total_salt += salt * volume
                total_protein += protein * volume
                total_carbo += carbohydrate * volume
                total_fat += fat * volume

        result = {
            'kcal': int(total_kcal),
            'salt': int(total_salt),
            'protein': int(total_protein),
            'carboHydrate': int(total_carbo),
            'fat': int(total_fat)
        }   
        return  json.dumps(result, ensure_ascii=False)
    
    except Exception as e:
        return jsonify({"error": str(e)})


# 유저 리뷰 모아보기
@app.route('/reviews/<storeName>/text', methods = ['GET'])
def get_all_reviews_text(storeName):
    cursor = get_db().cursor()
    cursor.execute("SELECT * FROM OrderInfo \
                   WHERE storeName=?", (storeName,))
    reviews = cursor.fetchall()
    cursor.close()
    
    dateTimes= []
    userIDs = []
    menuNames= []
    starss=[]
    reviewImageURLs=[]
    reviewTexts= []
    for review in reviews:
        dateTime, userID, storeName, menuName, stars, isReviewed, reviewImageURL, reviewText = review
        
        if stars == 0 or isReviewed == 0:
            continue
        else:
            dateTimes.append(dateTime)
            userIDs.append(userID)
            menuNames.append(menuName)
            starss.append(stars)
            reviewImageURLs.append(reviewImageURL)
            reviewTexts.append(reviewText)

    result = {
        "dateTimes": dateTimes,
        "userIDs": userIDs,
        "menuNames": menuNames,
        "stars": starss,
        "reviewImageURLs": reviewImageURLs,
        "reviewTexts": reviewTexts
    }
    return json.dumps(result, ensure_ascii=False)

# 유저 리뷰 사진 불러오기
@app.route('/reviews/<reviewImageURL>', methods = ['GET'])
def get_review_image(reviewImageURL):
    reviewImage = reviewImageURL
    imagePath = os.path.join(os.path.dirname(__file__), 'static', 'staticdata_reviews', reviewImage)

    if not os.path.exists(imagePath) or os.path.getsize(imagePath) == 0:
        return Response(status=204)

    return send_file(imagePath, mimetype='image/jpeg')


# 유저 기록 조회하기
@app.route('/orderInfo/<userID>', methods = ['GET'])
def get_order_info(userID):
    cursor = get_db().cursor()
    cursor.execute("SELECT dateTime, storeName,	menuName, stars \
                   FROM OrderInfo WHERE userID=?",(userID,))
    result = cursor.fetchall()
    cursor.close()
    record = []
    for row in result:
        dateTime, storeName, menuName, stars = row
        record.append({
            "dateTime": dateTime,
            "storeName": storeName,
            "menuName": menuName,
            "stars": stars
        })

    # JSON으로 반환
    return json.dumps(record, ensure_ascii=False)

# 유저 최근 30일 개수 조회하기
@app.route('/orderInfo/<userID>/oneMonthCount', methods = ['GET'])
def get_one_month_count(userID):
    cursor = get_db().cursor()
    thirty_days_ago = datetime.now() - timedelta(days=30)
    thirty_days_ago_str = thirty_days_ago.strftime('%Y-%m-%d %H:%M:%S')

    cursor.execute("SELECT COUNT(*) FROM OrderInfo \
                   WHERE dateTime >= ? AND userID=?", (thirty_days_ago_str,userID,))
    count = cursor.fetchone()[0]
    cursor.close()
    return jsonify({"count": count})


def insert_dummy():
    c = get_db().cursor()
    menu_info_data = [
        ('청담동김밥', '김밥', 'default', '기본적인 김밥', '일반', 250, 2, 8, 40, 5, 'basic_kimbab.jpg', 5000),
        ('청담동김밥', '김밥', '마요네즈', '마요네즈를 추가한 참치김밥', '일반', 300, 3, 12, 35, 7, 'tuna_kimbab.jpg', 6000),
        ('블루커피', '아메리카노', 'default', '클래식 아메리카노', '음료', 10, 0, 0, 2, 0, 'americano.jpg', 4000),
        ('블루커피', '아메리카노', '시럽 추가', '바닐라 시럽 추가', '음료', 50, 0, 0, 8, 0, 'americano_syrup.jpg', 4500),
        ('블루커피', '라떼', 'default', '부드러운 라떼', '음료', 150, 0.5, 6, 15, 7, 'latte.jpg', 5000)
    ]

    menu_options_data = [
        ('청담동김밥', '김밥', 'default', '기본 옵션'),
        ('청담동김밥', '김밥', '마요네즈', '추가 옵션'),
        ('블루커피', '아메리카노', 'default', '시럽'),
        ('블루커피', '아메리카노', '시럽 추가', '시럽')
    ]

    menu_groups_data = [
        ('청담동김밥', '김밥', '기본 옵션', 'radiobutton', 1, 1),
        ('청담동김밥', '김밥', '추가 옵션', 'checkbox', 0, 1),
        ('블루커피', '아메리카노', '시럽 추가', 'radiobutton', 0, 1)
    ]

    store_details_data = [
        ('청담동김밥', '서울의 유명한 김밥집', 'kimbab.jpg', 37.5234, 127.0248, 4.5),
        ('블루커피', '신선한 원두를 사용하는 커피숍', 'coffee.jpg', 37.5111, 127.0983, 4.2)
    ]

    reviews_data = [
        ('2024-08-05 14:30', 101, '청담동김밥', '김밥', 5, 1, 'review1.jpg', '정말 맛있어요!'),
        ('2024-08-06 16:45', 101, '청담동김밥', '김밥', 4, 1, 'review2.jpg', '참치가 신선하네요!'),
        ('2024-08-07 18:00', 103, '블루커피', '아메리카노', 3, 0, None, '조금 싱거운 편이에요.'),
        ('2024-08-08 19:30', 103, '블루커피', '라떼', 4, 1, 'review4.jpg', '부드럽고 크리미해요.')
    ]

    ingredients_data = [
        ('김치', 30, 1.2, 2.0, 4.0, 0.3),
        ('참치', 184, 0.7, 25.0, 0, 8.0),
        ('커피', 2, 0, 0.3, 0, 0),
        ('우유', 42, 0.1, 3.4, 4.9, 1.0)
    ]
    ingredients_data = {
        "bulgogi": {"Carbohydrate": 0.2, "Protein": 2.3, "Fat": 4.5, "Sodium": 300},
        "kimchi": {"Carbohydrate": 1.0, "Protein": 0.5, "Fat": 0.2, "Sodium": 600},
        "meat": {"Carbohydrate": 0.0, "Protein": 3.0, "Fat": 5.0, "Sodium": 60},
        "noodle": {"Carbohydrate": 0.7, "Protein": 0.2, "Fat": 0.5, "Sodium": 5},
        "plate": {"Carbohydrate": 0.0, "Protein": 0.0, "Fat": 0.0, "Sodium": 0},
        "potato": {"Carbohydrate": 0.2, "Protein": 0.1, "Fat": 0.0, "Sodium": 5},
        "pumpkin": {"Carbohydrate": 0.3, "Protein": 0.1, "Fat": 0.0, "Sodium": 1},
        "rice": {"Carbohydrate": 0.3, "Protein": 0.1, "Fat": 0.0, "Sodium": 1},
        "salad": {"Carbohydrate": 0.5, "Protein": 0.2, "Fat": 0.1, "Sodium": 50},
        "scramble": {"Carbohydrate": 0.5, "Protein": 2.0, "Fat": 4.0, "Sodium": 150},
        "soup": {"Carbohydrate": 0.8, "Protein": 0.5, "Fat": 1.0, "Sodium": 400},
        "tofu": {"Carbohydrate": 1.0, "Protein": 2.0, "Fat": 2.0, "Sodium": 5}
    }
    tables = ['MenuInfo', 'MenuOptionInfo', 'GroupInfo', 'StoreInfo', 'OrderInfo', 'IngredientInfo']
    empty_tables = []
    for table in tables:
        c.execute(f"SELECT COUNT(*) FROM {table}")
        count = c.fetchone()[0]
        if count == 0:
            empty_tables.append(table)

    # 모든 테이블이 비어 있는지 확인
    if len(empty_tables) != len(tables):
        return
    
    # 데이터베이스에 데이터 삽입
    c.executemany('INSERT INTO MenuInfo VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)', menu_info_data)
    c.executemany('INSERT INTO MenuOptionInfo VALUES (?, ?, ?, ?)', menu_options_data)
    c.executemany('INSERT INTO GroupInfo VALUES (?, ?, ?, ?, ?, ?)', menu_groups_data)
    c.executemany('INSERT INTO StoreInfo VALUES (?, ?, ?, ?, ?, ?)', store_details_data)
    c.executemany('INSERT INTO OrderInfo VALUES (?, ?, ?, ?, ?, ?, ?, ?)', reviews_data)
    c.executemany('INSERT INTO IngredientInfo VALUES (?, ?, ?, ?, ?, ?)', ingredients_data)

    # 커밋 및 연결 종료

    get_db().commit()
    c.close()
    print("dummy insert complete")
    return


def init_db():
    # create initial table
    cursor = get_db().cursor()
    sql_query='''
    CREATE TABLE IF NOT EXISTS IngredientInfo (
        Ingredient TEXT,
        kcal REAL, 
        salt REAL, 
        protein REAL, 
        carbohydrate REAL, 
        fat REAL
    )'''
    cursor.execute(sql_query)
    sql_query='''
    CREATE TABLE IF NOT EXISTS MenuInfo (
        storeName TEXT,
        menuName TEXT,
        optionName TEXT,
        description TEXT,
        menuType TEXT,
        kcal INTEGER,
        salt INTEGER,
        protein INTEGER,
        carbohydrate INTEGER,
        fat INTEGER,
        menuImageURL TEXT, 
        price INTEGER
    )'''
    cursor.execute(sql_query)
    sql_query='''CREATE TABLE IF NOT EXISTS MenuOptionInfo (
        storeName TEXT, 
        menuName TEXT, 
        optionName TEXT, 
        groupName TEXT
    )'''
    cursor.execute(sql_query)
    sql_query='''CREATE TABLE IF NOT EXISTS GroupInfo (
        storeName TEXT, 
        menuName TEXT, 
        groupName TEXT, 
        groupType TEXT, 
        groupMin INTEGER, 
        groupMax INTEGER
    )'''
    cursor.execute(sql_query)
    sql_query='''CREATE TABLE IF NOT EXISTS StoreInfo (
        storeName TEXT, 
        description TEXT, 
        storeImageURL TEXT, 
        latitude REAL, 
        longitude REAL, 
        preference REAL
    )'''
    cursor.execute(sql_query)
    sql_query='''CREATE TABLE IF NOT EXISTS OrderInfo (
        dateTime TEXT, 
        userID INTEGER, 
        storeName TEXT, 
        menuName TEXT, 
        stars INTEGER, 
        isReviewed INTEGER, 
        reviewImageURL TEXT, 
        reviewText TEXT
    )'''
    cursor.execute(sql_query)
    get_db().commit()
    cursor.close()
    insert_dummy()
    print("db init complete")

# initialize
with app.app_context():
    init_db()

    
if __name__ == '__main__':
    print("public API server")
    app.run( port=80, debug= True, host = '0.0.0.0')

