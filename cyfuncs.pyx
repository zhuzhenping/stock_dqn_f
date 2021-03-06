# -*- coding: utf-8 -*-
import numpy as np
import math

#processing array index to 0~1
def normalizationArray(array,_min,_max):
    cdef float amin, amax
    
    amin = float(_min)
    amax = float(_max)
    
    if amin != amax:
        array = np.clip(array, amin, amax)
        new_array = (array - amin) / (amax - amin)
        
    #期間の最大最小が等しい場合はすべての要素を0.5とする
    elif amin==amax:
        new_array = np.array([0.5]*len(array))
            
    return new_array
    

def normalizationArray_new(array):

    eps = 2e-5
    
    a_mean = np.mean(array)
    a_var = np.var(array)
    new_array = (array - a_mean) / math.sqrt(a_var + eps)
            
    return new_array