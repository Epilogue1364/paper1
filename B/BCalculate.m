function B=BCalculate(h,t,m)
summax=0;
summin=0;
for i=1:t:m
    peakmax=max(h(i:i+t-1));
    peakmin=min(h(i:i+t-1));
    summax=summax+peakmax;
    summin=summin+peakmin;
end
B=summax-summin;