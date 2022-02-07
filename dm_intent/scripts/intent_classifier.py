#!/usr/bin/python3
# -*- coding: utf-8 -*-
import rospkg
import torch
import pickle
from gluonnlp.data import SentencepieceTokenizer
# from kobert.utils import get_tokenizer

test_path = rospkg.RosPack().get_path('dm_intent')
# test_path = '..'
tokenizer_path = '/data/tokenizer/kobert_news_wiki_ko_cased-1087f8699e.spiece'

class Model:
    def __init__(self, ckpt):
        # check map_location whether cpu or gpu
        self.kobert = torch.load(ckpt, map_location=torch.device('cpu')) # 학습된 모델 불러오기
        self.kobert.eval()
        self.sp = SentencepieceTokenizer(test_path+tokenizer_path)
        with open(test_path + '/data/word2id.pkl', 'rb') as f:
            self.word2id = pickle.load(f)
    def inference(self, text):
        
        # word to id
        inp =[[self.word2id[ele] if ele in self.word2id.keys() else 0 for ele in ['[CLS]']+self.sp(text)+['[SEP]']]]
        inp = torch.tensor(inp)
        out = self.kobert(inp) # 학습된 모델에 텍스트 입력해서 나온 결과
        _, result = torch.max(out, 1)   # result는 1d-tensor. tensor to list : .tolist()
        
        return result.tolist()[0]
