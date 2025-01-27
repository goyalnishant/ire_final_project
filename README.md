# Language Modelling

This application is an implementation of both the statistical (Ngram based) and deeplearning (LSTM RNN based) language models built for three social media channels, Facebook,Twitter and Instagram. The api has functionality of training , testing models and predicting from them. The prediction which means text generation using trained language model can be done in ```unconditioned``` and ```conditioned``` way. Read following sections to know more about it.    
 

## Requirements

Support for Python 3. Install the package requirements via
```console
pip install -r requirements.txt
```  
 
## Data
 
The preprocessed data for different social media platforms can be found inside ```data/preprocessed/<type>```, where <type> denotes directory name for specific social media platform which are as follows: ```tw``` for twitter, ```insta```for instagram and ```fb``` for facebook. The stats for preprocessed data for all three platforms are given below.
```
Twitter: 40.6 Lakhs sequences
Instagram: 1.38 Lakhs sequences including instagram image captions and comments 
FaceBook: 11.4 Lakhs sequences including facebook post and comments
``` 
The word "sequence" refers to 'tweets' for twitter, it can be post or a comment for facebook and similarly it can be caption or a comment for instagram.

```NOTE:``` The preprocessed data for each platforms are splitted into train-test-dev in ratio 8:1:1. The data is shuffled before making the splits. The data splits for various social platforms can be found under ```model_data/<type>``` directory for different social media <type> as mentioned above.     
## Usage

### 1. Training
Set the optional hyperparameters values required for training in ```train.sh``` file. Default Values for parameters is present in Hyper Parameter Section. 

```NOTE:``` The format of training file can be both pickled and text. If the format is pickled, then it would expect it to be a list of sequences where each sequence is of ```string``` format and if its in text foramat then it would expect one sequence per line or sequences separated by newline character.  
Moreover, the trianing data should be preprocessed beforehand. You can also use our preprocess script built for the purpose which is located in ```scripts/preprocess.py``` which would take raw text file and outputs preprocessed text file with each sequence in each line.     
```
1.1 N-Gram Model,use
    console
    ./train.sh ngram <Path to train data> <Path to store trained model>
   
1.2 LSTM Model,use:
     console
    ./train.sh lstm <Path to train data> <Path to store trained model>
```
 ### HyperParameter
```  
1. NGram Model
   The following arguments for training are optional:
   -g         Lidstone factor/Gamma[0.5]
   -d         Kneserney discouting factor[0.75]
2. LSTM Model
   The following arguments for training are optional:
   -hl        No of Hidden layers[1]
   -n         No of Nodes in each hidden layer[500]
   -dr        Dropout Factor[0.1]
   -e         No of Epochs[100]
   -lr        Learning rate[0.001]
   -b         Batch Size[128]
   -i         Training data file
   -o         Output model file(Ex: /data/model1)
   -w         (word embedding: no/pre-glove/glove)[no]
```  
   
### 2.  Text Generation
```
1 N-Gram Model
     1.1 For unconditional text generation, use:
        console
      ./predict.sh ngram 0 <no of words> <Path to use trained model>
   
     1.2 For conditional text generation, use:
        console
      ./predict.sh ngram 1 <no of words> <Path to use trained model> text
      
2. LSTM Model
      2.1. For lstm unconditional text generation, use:
         console
         ./predict.sh lstm 0 <no of words> <Path to use trained model>
   
      2.2. For lstm conditional text generation,use:
         console
         ./predict.sh lstm 1 <no of words> <Path to use trained model> text

  1   Conditional text generation flag
  0   Uncondiitonal text generation flag
  text  context text. Format: space separated tokens string 
``` 

## Output
```
Trained models of all three social platforms are stored in ```lm_models/<model_type>/<data_type>```. Here <model_type> is ```ngram_models``` if model trained is N-gram else it is "lstm_models". 
Predicted text will be displayed in console.         

Download necessaary utils from https://iiitaphyd-my.sharepoint.com/:f:/g/personal/priyansh_agrawal_research_iiit_ac_in/EnV74VjDxMNNohD1LJ1QE5oB8eHv39TGAAhSAIXA1nC5mQ?e=CMuQyv
```