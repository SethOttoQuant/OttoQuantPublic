# Standard examples of calling the OttoQuant ML API

import numpy as np
import pandas as pd
import requests
import json

def json_done_right(df):
    df = pd.DataFrame(df)
    out = '{'
    for column in df:        
        out = out + '"' + str(column) + '"' + ':'
        out = out + df.loc[:,column].to_json(orient = 'values') + ","
    return out[:-1] + "}"
        
def test_key(keyval):
    call = 'http://142.93.85.22:80/testkey?keyval=' + keyval
    out = requests.get(call)
    return out.text

def OttoML(keyval, training_data, observations, MF_weights = 'none',
           sd = 1, gp = 11, shape = 0):
    
    if isinstance(MF_weights, (pd.DataFrame, np.ndarray)):
        MF_weights = json_done_right(MF_weights)
    
    dct = {"keyval" : keyval,
       "training_data": json_done_right(training_data), 
       "observations": json_done_right(observations),
       "MF_weights": MF_weights,
       "sd": sd,
       "gp": gp,
       "shape": shape}
    
    out = requests.post(url = 'http://142.93.85.22:80/OttoML', data = json.dumps(dct))
    return json.loads(out.text)

def OttoBoot(keyval, training_data, 
             sd = 1, gp = 11, shape = 0):
    
    dct = {"keyval" : keyval,
       "training_data": json_done_right(training_data), 
       "sd": sd,
       "gp": gp,
       "shape": shape}
    
    out = requests.post(url = 'http://142.93.85.22:80/OttoBoot', data = json.dumps(dct))
    return json.loads(out.text)

# Simulate some data
def sim_ten(r):
    X = np.matrix(np.random.normal(0,1,[r,10]))
    beta = np.matrix((2,-1,4,-5,3,0,6,-7,3,2))
    y = X*np.transpose(beta) + np.random.normal(0,1,[r,1])
    dct = {"X": X, "y": y}
    return(dct)

train = sim_ten(200)
obs = sim_ten(100)
training_data = np.concatenate((train["y"],train["X"]),axis=1)
observations = obs["X"]

keyval = "your_key"

res_ml = OttoML(keyval, training_data, observations)
mse = np.mean(np.square(obs["y"] - res_ml["x_point"]))
1-mse/np.mean(np.square(obs["y"] - np.mean(obs["y"])))

res_boot = OttoBoot(keyval, training_data)
res_boot["R2"]
