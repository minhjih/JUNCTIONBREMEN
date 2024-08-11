from flask import Flask, jsonify, request, Response, Blueprint
import requests

request_bp = Blueprint('request_bp', __name__, url_prefix='/request')

# Request 접근
# HTTP method 제한 가능
@request_bp.route('/',methods=['POST', 'GET'])
def user_profile():
    # 메소드 접근 request.form
    method = request.method

    # URL 파라미터 접근
    # /request?username=joon363
    user = request.args.get("username", "")
    
    # 요청 json body 접근
    payload = request.get_json()
    message = payload['message']

    # 요청 Header 접근
    auth = request.headers.get('Authorization')
    
    return jsonify(num=3)

# 동적인 URL 파라미터 사용
# string 아닌 값이 들어오면 Not Found 띄움
@request_bp.route('/user/<string:username>')
def show_user_profile(username):
    return f'User: {username}'