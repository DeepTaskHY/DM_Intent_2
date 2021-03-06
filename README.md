# 1. [M2-7] Intention Classifier

## 2. Package summery 

Intention Classifier is a module that analyzes the intention of the user’s utterance. This module modifies and combines “bi-RNN” and “Attention mechanism” to implement an Intention classification model.

- 2.1 Maintainer status: maintained
- 2.2 Maintainer: Wonhyuk Choi, [gandet09@hanyang.ac.kr]()
- 2.3 Author: Wonhyuk Choi, [gandet09@hanyang.ac.kr]()
- 2.4 License (optional): 
- 2.5 Source git: https://github.com/DeepTaskHY/DM_Intent_2

## 3. Overview

To analyze the intention of the user's utterance, this module consists of two parts: 1)keyword extraction, 2)intention analysis. To extract the keywords of the user's utterance, we used Google Dialogflow. This module use KoBERT(https://github.com/SKTBrain/KoBERT.git) to implement an Intention classification model.

## 4. Hardware requirements

None

## 5. Quick start 

### 5.1 Install dependency:

**requirements**  

    torch == 1.7.1
    mxnet >= 1.4.0
    gluonnlp >= 0.6.0
    sentencepiece >= 0.1.6
    onnxruntime >= 0.3.0
    transformers < 4
    scikit-learn >= 1.0
    google-cloud-dialogflow==2.7.1
    https://github.com/SKTBrain/KoBERT/archive/master.zip
    https://github.com/DeepTaskHY/ROS/archive/main.zip


### 5.2 Start the module

- Go to [Author's Google Drive](https://drive.google.com/file/d/1Tya9XQrtlAv393xh8D_5MYfBAta15quz/view?usp=sharing) and download the JSON file (authorization key), and put it in the [authorization folder](dm_intent/keys/).

**docker environment**

    $ git clone $rpository_rul
    $ docker-compose build
    $ docker-compose up dm

**local environment(linux)**

    $ git clone $rpository_url
    $ cd $repository
    $ sh dm_intent/model_download.sh
    $ pip install -r requirements.txt
    $ roslaunch dm_intent dm_intent_launcher.launch
    


## 6. Input/Subscribed Topics

```
{  
   "header": {
        "id": 1,
        "source": "perception",
        "target": ["dialog_intent", "planning"],
        "timestamp": "1563980552.933543682",
        "content": ["human_speech"]
   },
   "human_speech":{ 
      "speech": "안녕하세요"
   }
}
```

○ header (header/recognitionResult): contain information about published time, publisher name, receiver name and content.  

- timestamp: published time  
- source: publish module name  
- target: receive module name  
- content: role of this ROS topic name  

○ dialog_intent (dialog_intent/recognitionResult): contain human speech and user name.  

- speech: human speech    
- name: user name   
- information: keyword to use for intention classification 

## 7. Output/Published Topics

```
{
    "header": {
        "id": 1,
        "timestamp": "1563980561.940629720",
        "source": "dialog",
        "target": ["planning"], 
        "content": ["dialog_intent"],
    }, 
    "dialog_intent": {
        "speech": "좋아진 것 같아.", 
        "intent": "단순 정보 전달",
        "information": {}
    }
}
```

○ header (header/taskExecution): contain information about published time, publisher name, receiver name.  

- timestamp: published time  
- source: publish module name  
- target: receive module name  
- content: role of this ROS topic name  

○ dialog_generation (dialog_generation/taskExecution): contain generated robot speech sentence, id, result.  

- id: id  
- dialog: generated robot speech  
- result: task progress result  

## 8. Parameters

There are one category of parameters that can be used to configure the module: deep learning model.  

**8.1 model parameters**  

- Editing

## 9. Related Applications (Optional)

- KoBERT. https://github.com/SKTBrain/KoBERT.git

## 10. Related Publications (Optional)

- Mikolov, T., Chen, K., Corrado, G., & Dean, J. Efficient estimation of word representations in vector space. arXiv:1301.3781. Retrieved from https://arxiv.org/abs/1301.3781 , 2013 
- Jeongmin Yoon and Youngjoong Ko. Speech-Act Analysis System Based on Dialogue Level RNNCNN Effective on the Exposure Bias Problem. Journal of KIISE, 45, 9 (2018), 911-917, 2018
