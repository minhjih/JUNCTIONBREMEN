import argparse
import torch
import cv2
import os
#import torch.nn.parallel
import modules, net, resnet, densenet, senet
import numpy as np
import loaddata_demo as loaddata
import pdb

from volume import get_volume
from mask import get_mask

import matplotlib.image
import matplotlib.pyplot as plt
from get_json_from_image import get_food_json

def define_model(is_resnet, is_densenet, is_senet):
    if is_resnet:
        original_model = resnet.resnet50(pretrained = True)
        Encoder = modules.E_resnet(original_model) 
        model = net.model(Encoder, num_features=2048, block_channel = [256, 512, 1024, 2048])
    if is_densenet:
        original_model = densenet.densenet161(pretrained=True)
        Encoder = modules.E_densenet(original_model)
        model = net.model(Encoder, num_features=2208, block_channel = [192, 384, 1056, 2208])
    if is_senet:
        original_model = senet.senet154(pretrained='imagenet')
        Encoder = modules.E_senet(original_model)
        model = net.model(Encoder, num_features=2048, block_channel = [256, 512, 1024, 2048])

    return model
   

def run(img_loc = "./input.jpg"):
    if (not os.path.exists("./output")):
        print("Output directory doesn't exist! Creating...")
        os.makedirs("./output")

    model = define_model(is_resnet=False, is_densenet=False, is_senet=True)
    #model = torch.nn.DataParallel(model).cuda()
    model.load_state_dict(torch.load('./pretrained_model/model_senet'))
    model.eval()
 
    img = cv2.imread(img_loc)

    get_food_json(img, img_loc) # food json masking 영역 가져오기
    
    nyu2_loader = loaddata.readNyu2(img_loc)
  
    test(nyu2_loader, model, img.shape[1], img.shape[0])
    

def test(nyu2_loader, model, width, height):
    for i, image in enumerate(nyu2_loader):
        image = torch.autograd.Variable(image, volatile=True).cuda()
        out = model(image)
        out = out.view(out.size(2),out.size(3)).data.cpu().numpy()
        max_pix = out.max()
        min_pix = out.min()
        out = (out-min_pix)/(max_pix-min_pix)*255
        out = cv2.resize(out,(width,height),interpolation=cv2.INTER_CUBIC)
        cv2.imwrite(os.path.join("./output", "out_grey.png"),out)
        out_grey = cv2.imread(os.path.join("./output", "out_grey.png"),0)
        out_color = cv2.applyColorMap(out_grey, cv2.COLORMAP_JET)
        cv2.imwrite(os.path.join("./output", "out_color.png"),out_color)
        vol = get_volume(out_grey, "./labelme_annotations_ellipse.json")
        print("Volume:")
        print(vol)
        print("unit: cm^3")

        """
        vol 딕셔너리로 volume 나타내는거 -> 테이블 계산하기
        """
        out_file = open(os.path.join("./output", "out.txt"), "w")
        out_file.write("Volume:\n")
        out_file.write(str(vol))
        out_file.write("\n")
        out_file.write("unit: cm^3")
        out_file.close()
        get_mask(out_grey, "./labelme_annotations_ellipse.json", "./output")

if __name__ == "__main__":
    run("./test/images/IMG_5808_jpeg.rf.2679f78fabc95e90c79cb1702fea98be.jpg")
