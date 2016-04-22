cd $1 #outputfolder with all the analyzed attacks

ls |while read pcap
do 
	last_column=`cat $pcap/*.csv|head -1 |awk -F ";" '{ print $NF; }'`
	echo $pcap
	echo $last_column
	if [ $last_column != "blame" ]
		then 
			sed -e "1 s/$/;blame/" $pcap/*.csv > temp
			if [[ $pcap =~ "ANON-" ]] 
				then sed -e "2,$ s/$/;anonymous-stresser.com/" temp > $pcap/*.csv
			elif [[ $pcap =~ "BOOTIO-" ]]
				then sed -e "2,$ s/$/;booter.io/" temp > $pcap/*.csv
			elif [[ $pcap =~ "CONS-" ]]
				then sed -e "2,$ s/$/;connectionstresser.com/" temp > $pcap/*.csv
			elif [[ $pcap =~ "DEST-" ]]
				then sed -e "2,$ s/$/;destressbooter.com/" temp > $pcap/*.csv
			elif [[ $pcap =~ "HORNY-" ]]
				then sed -e "2,$ s/$/;hornystress.me/" temp > $pcap/*.csv
			elif [[ $pcap =~ "IPSTR-" ]]
				then sed -e "2,$ s/$/;ipstresser.com/" temp > $pcap/*.csv
			elif [[ $pcap =~ "KRYPT-" ]]
				then sed -e "2,$ s/$/;kryptonic.pw/" temp > $pcap/*.csv
			elif [[ $pcap =~ "LEGION-" ]]
				then sed -e "2,$ s/$/;legion.cm/" temp > $pcap/*.csv
			elif [[ $pcap =~ "NETNET-" ]]
				then sed -e "2,$ s/$/;networkstresser.net/" temp > $pcap/*.csv
			elif [[ $pcap =~ "NETCOM-" ]]
				then sed -e "2,$ s/$/;networkstresser.com/" temp > $pcap/*.csv
			elif [[ $pcap =~ "POWER-" ]]
				then sed -e "2,$ s/$/;powerstresser.com/" temp > $pcap/*.csv
			elif [[ $pcap =~ "QUANT" ]]
				then sed -e "2,$ s/$/;quantumbooter.net/" temp > $pcap/*.csv
			elif [[ $pcap =~ "RAGE-" ]]
				then sed -e "2,$ s/$/;ragebooter.com/" temp > $pcap/*.csv
			elif [[ $pcap =~ "REST-" ]]
				then sed -e "2,$ s/$/;restricted-stresser.info/" temp > $pcap/*.csv
			elif [[ $pcap =~ "TITAN-" ]]
				then sed -e "2,$ s/$/;titaniumstresser.net/" temp > $pcap/*.csv
			elif [[ $pcap =~ "VDOS-" ]]
				then sed -e "2,$ s/$/;vdos-s.com/" temp > $pcap/*.csv
			else sed -e "2,$ s/$/;unknown/" temp > $pcap/*.csv
			fi
			rm temp
		else continue
	fi
done