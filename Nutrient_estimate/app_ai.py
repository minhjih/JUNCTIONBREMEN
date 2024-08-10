from flask import Flask, g, jsonify, request, Blueprint, send_file, Response
import os
import json
import demo
import calculate_nutrient
import ast
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
  demo.run()
  with open('output/out.txt', 'r') as file:
        content = file.read()
  data_dict = ast.literal_eval(content)

  return jsonify(calculate_nutrient.calculate_nut(data_dict))
  
    
if __name__ == '__main__':
    print("local ai server")
    app_ai.run( port=5000, debug= True, host = '0.0.0.0')