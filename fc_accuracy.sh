#! /usr/bin/bash
yesterday_fc=$(tail -2 rx_poc.log | head -1 | cut -d " " -f5)
today_temp=$(tail -1 rx_poc.log | cut -d " " f4)
accuracy=$(($yesterday_fc-$today_temp))
if [ $accuracy -le 1 ] && [ $accuracy -ge -1 ]
then
    accuracy_range=excellent
elif [ $accuracy -le 2 ] && [ $accuracy -ge -2 ]
then    
    accuracy_range=good
elif [ $accuracy -le 3 ] && [ $accuracy -ge -3 ]
then
    accuracy_range=fair
else
    accuracy_range=poor
fi
echo "Forecast accuracy is $accuracy"
row=$(tail -1 rx_pox.log)
year=$(echo $row | cut -d " " -f1)
month=$(echo $row | cut -d " " -f2)
day=$(echo $row | cut -d " " -f3)
echo -e "$year\t$month\t$day\t$today_temp\t$yesterday_fc\t$accuracy\t$accuracy_range" >> historical_fc_accuracy.tsv
