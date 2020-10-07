function [b0 b1]=nparam(np0,npf,B,a)
b0=((np0(1)-B*np0(2))-(npf(1)-B*npf(2)))/(exp(-a*np0(3))-exp(-a*npf(3)));
b1=exp(-a*np0(3))*(npf(1)-B*npf(2))-exp(-a*npf(3))*(np0(1)-B*np0(2));
