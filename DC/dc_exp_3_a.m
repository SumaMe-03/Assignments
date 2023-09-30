clc;
clear all;
close all;
pkg load communications
symbols = 1:5;
p=[0.4 0.2 0.2 0.1 0.1];
disp(symbols);
disp(p);
dict = huffmandict(symbols,p);
disp(dict);
inputSig = randsrc(10,1,[symbols;p]);
disp(inputSig);
code = huffmanenco(inputSig,dict);
disp(code);
decode = huffmandeco(code,dict);
disp(decode);

clear all;
clc;
list_symb = [1 2 3 4 ];
list_proba = [0.5 0.25 0.125 0.125];
dict = shannonfanodict(list_symb,list_proba);
disp(dict)
%dict = shannonfanodict(list_symb,list_proba,0,true);
%disp(dict);

inputSig =[3 3 1 1 1 2 3 3 4];
code = shannonfanoenco(inputSig,dict);
disp(code);
