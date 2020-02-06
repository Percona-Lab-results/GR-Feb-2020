runid="1"
RUNDIR=res-tpcc-no-GR-mysql-8.0.19-$runid
#for i in 16 64 128 256
for i in 1 2 4 8 16 64 128 256
do
     	OUTDIR=$RUNDIR/
        mkdir -p $OUTDIR

        time=3600
	./tpcc.lua --mysql-host=10.30.2.5 --mysql-user=sbtest --mysql-password=sbtest --mysql-db=sbtest --time=3600 --threads=$i --report-interval=1 --tables=10 --scale=100 --trx_level=RR  --db-driver=mysql --report_csv=yes --mysql-ignore-errors=3100,3101,1213,1180 run |  tee -a $OUTDIR/res_thr$i.txt

	sleep 30
	done
