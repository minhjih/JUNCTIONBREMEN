from flask import Flask, jsonify, request
import demo
app_ai = Flask(__name__)
@app_ai.route('/')
def home():
  return 'Hello, this is the ai page!'


@app_ai.route('/YOLO', methods = ['POST'])
def image_process():
  print("local server on")
  #return jsonify({"bulgogi": 10, "Protein": 20})
  image = request.files['image']
  image.save('input.jpg')
  total_nutrient=demo.run()
  print("aa")
  nutrient = {}
  nutrient["Carbohydrate(g)"] = int(round(total_nutrient["Carbohydrate"]))
  nutrient["Protein(g)"] = int(round(total_nutrient["Protein"]))
  nutrient["Fat(g)"] = int(round(total_nutrient["Fat"]))
  nutrient["Sodium(mg)"] = int(round(total_nutrient["Sodium"] / 1000.0))
  nutrient["Calories(kcal)"] = int(round(total_nutrient["Calories"]))
  return jsonify(nutrient)
    
if __name__ == '__main__':
    print("local ai server")
    app_ai.run( port=5000, debug= True, host = '0.0.0.0')