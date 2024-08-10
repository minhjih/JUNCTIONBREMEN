from ultralytics import YOLO
import cv2
import json
import numpy as np
import os
import torch
import cv2
import json
import numpy as np
import os
from ultralytics import YOLO

def get_food_json(image_json):
    model = YOLO("./best.pt")
    class_list = ['bulgogi', 'kimchi', 'meat', 'noodle', 'plate', 'potato', 'pumpkin', 'rice', 'salad', 'scramble', 'soup', 'tofu']
    
    '''
    image load 부분 json으로 가져 올거면 이 부분 image로 변환해서 image 읽어야함.
    '''
    # 테스트 이미지 로드
    image_path = './train/images/IMG_5809_jpeg.rf.61e70cdc7fd3b0a7ed62145499d0edc5.jpg'
    image = cv2.imread(image_path) 
    '''
    
    '''
    # 객체 탐지
    results = model(image)
    
    # LabelMe 형식의 JSON 구조 초기화
    labelme_data = {
        "version": "4.5.6",
        "flags": {},
        "shapes": [],
        "imagePath": os.path.basename(image_path),
        "imageData": None,
        "imageHeight": image.shape[0],
        "imageWidth": image.shape[1]
    }
    
    # 타원 점 생성 함수
    def generate_ellipse_points(center, axes, num_points=20):
        points = []
        for i in range(num_points):
            theta = 2 * np.pi * i / num_points  # 각도 계산
            x = center[0] + axes[0] * np.cos(theta)  # x 좌표
            y = center[1] + axes[1] * np.sin(theta)  # y 좌표
            points.append([int(x), int(y)])
        return points
    
    for result in results:
        boxes = result.boxes.xyxy  
        scores = result.boxes.conf  
        classes = result.boxes.cls 
    
        for box, score, cls in zip(boxes, scores, classes):
            if score > 0.8:  # 신뢰도가 0.8 이상
                # 타원의 중심과 반지름 설정
                center = [(box[0] + box[2]) / 2, (box[1] + box[3]) / 2]  # 경계 상자 중심
                axes = [(box[2] - box[0]) / 2, (box[3] - box[1]) / 2]  # 반지름
    
                points = generate_ellipse_points(center, axes)  # 타원 점 생성
                shape = {
                    "label": class_list[int(cls)],  # 클래스 ID (필요에 따라 클래스 이름으로 변경 가능)
                    "points": points,
                    "group_id": None,
                    "shape_type": "polygon",
                    "flags": {}
                }
                labelme_data["shapes"].append(shape)
    
    # JSON 파일로 저장
    output_json_path = 'labelme_annotations_ellipse.json'
    with open(output_json_path, 'w') as json_file:
        json.dump(labelme_data, json_file, indent=4)
    
    print(f"LabelMe format results with ellipse points saved to {output_json_path}")