rm results.csv
for THREADS in {1..1001..20}
 do
	rm frontendresult.csv
    jmeter -n -t ./frontend.jmx  -JTHREADS=$THREADS 2> /dev/null 1> /dev/null 
    

    echo $THREADS,`python -c "d=open('frontendresult.csv').read().split('\n')
print reduce(lambda x,y:int(x)+int(y.split(',')[1]),  [x for x in d[:-1] if 'true' in x],0)/float(len(d))"` >> results.csv
    
    
    echo $THREADS,`python -c "d=open('frontendresult.csv').read().split('\n')
print float(len([x for x in d[:-1] if 'false' in x]))/len(d)"` >> errors.csv
    
    
done &
      
