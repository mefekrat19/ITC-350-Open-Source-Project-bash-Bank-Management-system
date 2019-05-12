menu(){
clear
echo "     ITC 350-Open Source Software Project     "
echo ""

echo "============================================================="
echo -e "        \e[36m Customer Account Banking System\e[0m            "
echo "============================================================="

echo -e "\e[31m1) Create a new customer account\e[0m"
echo ""
echo -e "\e[32m2) Update account data\e[0m"
echo ""
echo -e "\e[33m3) View and manage transaction\e[0m"
echo ""
echo -e "\e[34m4) Check customers account details\e[0m"
echo ""
echo "5) Delete customer's account"
echo ""
echo -e "\e[36m6) Exit\e[0m"

echo ""

echo "Enter the option:"
}
casefun(){
read t
case $t in 
	1)
	echo "If you want to go to the main menu press (x)"; new_account
	;;
	2) update;;
	3) Tranc;;
	4) fun;;
	5) delete;;
	6) exit;;
	*)
	echo "Invalid Option"
		echo "Enter the option:"
		casefun
            ;;
esac
}
	
new_account(){
touch database.csv
echo "Please Enter your first name:"
read customer_name
if [ "$customer_name" == "x" ]; then
menu; casefun;
else
echo "Please Enter your Last name:"
read customer_lname
echo "Please Enter your date of birth:"
read customer_DOB
echo "Please enter your national ID number:"
read customer_NID
echo "Please Enter your Phone Number:"
read customer_number 
echo "Please Enter your email address:"
read customer_email
echo "Enter the country:"
read customer_country 
echo "Enter the city:"
read customer_city
echo "What kind of you account you want(saving/current):"
read customer_account
echo "Please enter the amount to be deposited first:"
read customer_deposit
echo "Sucessfully Added"
	echo "$(($(tail -1 database.csv | awk '{print $1}' FS=",")+1)),$customer_name,$customer_lname,$customer_DOB,$customer_NID,$customer_number,$customer_email,$customer_country ,$customer_city,$customer_account,$customer_deposit" >> database.csv
if grep -q 'ID','First Name','Last Name','Date of Birth','National ID','Phone Number','Email Address','Country','City','Account Type','Amount' database.csv;
then
	echo""
else
ed -s database.csv < <(printf '%s\n' 1i "ID","First Name","Last Name","Date of Birth","National ID","Phone Number","Email Address","Country","City","Account Type","Amount" . wq)
fi
fi
check_function
}
check_function(){
echo "Press (q) to Exit the program or (m) to go to Main Menu"
read pre
        case $pre in
            q) exit; break ;;
            m) menu; casefun;;
	    *)
	echo 'Invalid Option' >&2
		check_function
            ;;
	esac

}
fun(){
	clear
	echo "Press (m) if you want to go to main menu"
	echo ""	
	echo "Please choose the search type:"
	echo "1) ID"
	echo "2) Name"
	while true; do
	read option
	if [ $option == "m" ]; then
	menu; casefun;
	else
	case $option in
	1) echo "Enter the ID:"
	read ID
	awk -v name="ID" 'BEGIN{FS=","; OFS="|"; NR==1} { if ($1 == name) { print } }' database.csv | head 
	echo ""
	 awk -v id=$ID 'BEGIN{FS=","; OFS="|"; NR==1} { if ($1 == id) { print } }' database.csv | head
	
	echo "Press (q) to Exit the program or (v) to go back to pervoius menu"
				read pre
        			case $pre in
           				 q) exit; break ;;
           				 v) fun;;
				esac
	;;
	2) echo "Enter the Name"
	read name
	if grep -q "$name" database.csv; then
	awk -v name="ID" 'BEGIN{FS=","; OFS="|"; NR==1} { if ($1 == name) { print } }' database.csv
	echo ""
	grep "$name" database.csv 
	echo ""
	echo "Press (q) to Exit the program or (v) to go back to pervoius menu"
	read pre
        			case $pre in
           				 q) exit; break ;;
           				 v) fun;;
				esac
	else
   	echo "Sorry this cusstomer does not have an account"
	echo "Press (q) to Exit the program or (v) to go back to pervoius menu"
				read pre
        			case $pre in
           				 q) exit; break ;;
           				 v) fun;;
				esac
	fi
	;;
	*)
		echo 'invalid input' >&2
		echo "Please choose the correct option:";;
	esac
	fi
	done
}
update(){
	clear
	echo "Press (m) if you want to go to main menu"
	echo ""
	echo "Enter the ID of that customer:"
	read enterID
	awk -v name="ID" 'BEGIN{FS=","; OFS="|"; NR==1} { if ($1 == name) { print } }' database.csv | head
	echo "" 
	 awk -v id=$enterID 'BEGIN{FS=","; OFS="|"; NR==1} { if ($1 == id) { print } }' database.csv | head
	if [ $enterID == "m" ]; then
	menu; casefun;
	else
	echo "Press (r) if you want to reenter the customer's ID"
	echo ""
	echo "Please choose one of the option to update:"
			echo "1) Name"
			echo "2) Date of Birth"
			echo "3) National ID"
			echo "4) Phone Number"
			echo "5) Email Address"
			echo "6) Country"
			echo "7) Account Type"
			echo "8) AMmount"
	while true; do	
	read z
	if [ $z == "r" ]; then
	update
	else
	case $z in 
	1)
		echo "What do you want to update:"
		echo "1) First Name"
		echo "2) Last Name"
				while true; do
				read name_op
				case $name_op in
				1) 

				echo -e "Insert the new Name"
				read nameInput
				awk -v id=$enterID -v name="$nameInput" 'BEGIN{FS=","; OFS=","} { if ($1 ~ id) $2=name; print}' database.csv > Data.tmp && mv Data.tmp database.csv
				echo "Data Recorded"
				echo ""
				echo "Press (q) to Exit the program or (u) to go to update menu"
				read pre
        			case $pre in
           				 q) exit; break ;;
           				 u) update;;
				esac
				;;
				2)
				
				echo -e "Insert the new last Name"
				read lnameInput
				awk -v id=$enterID -v name="$lnameInput" 'BEGIN{FS=","; OFS=","} { if ($1 ~ id) $3=name; print}' database.csv > Data.tmp && mv Data.tmp database.csv
				echo "Data Recorded"
				echo ""
				echo "Press (q) to Exit the program or (u) to go to update menu"
				read pre
        			case $pre in
           				 q) exit; break ;;
           				 u) update;;
				esac
				;;
				*)
				echo 'Invalid input' >&2;;
				esac
				done
	;;
	2)
	echo "Please enter the new Date of Birth:"
	read da
	awk -v id=$enterID -v input=$da 'BEGIN{FS=","; OFS=","} { if ($1 ~ id) $4=input; print}' database.csv > 			Data.tmp && mv Data.tmp database.csv
	echo "Data Recorded"
				echo ""
				echo "Press (q) to Exit the program or (u) to go to update menu"
				read pre
        			case $pre in
           				 q) exit; break ;;
           				 u) update;;
				esac
	;;
	3)
		echo "Please enter the new national ID:"
		read nat_ID
		awk -v id=$enterID -v input=$nat_ID 'BEGIN{FS=","; OFS=","} { if ($1 ~ id) $5=input; print}' database.csv > 			Data.tmp && mv Data.tmp database.csv
		echo "Data Recorded"
				echo ""
				echo "Press (q) to Exit the program or (u) to go to update menu"
				read pre
        			case $pre in
           				 q) exit; break ;;
           				 u) update;;
				esac
	;;
	4)
		echo "Please enter your new phone number:"
		read phone
		awk -v id=$enterID -v input=$phone 'BEGIN{FS=","; OFS=","} { if ($1 ~ id) $6=input; print}' database.csv > 			Data.tmp && mv Data.tmp database.csv
		echo "Data Recorded"
				echo ""
				echo "Press (q) to Exit the program or (u) to go to update menu"
				read pre
        			case $pre in
           				 q) exit; break ;;
           				 u) update;;
				esac
	;;
	5)
		echo "Please enter your new email address:"
		read emial
		awk -v id=$enterID -v input=$emial 'BEGIN{FS=","; OFS=","} { if ($1 ~ id) $7=input; print}' database.csv > 			Data.tmp && mv Data.tmp database.csv
		echo "Data Recorded"
				echo ""
				echo "Press (q) to Exit the program or (u) to go to update menu"
				read pre
        			case $pre in
           				 q) exit; break ;;
           				 u) update;;
				esac
	;;
	6)
		echo "What do you want to update:"
		echo "1) Country"
		echo "2) City"
		while true; do
		read country
		case $country in
			1)
				echo "Please enter the country's name:"
				read new_country
				awk -v id=$enterID -v input=$new_country 'BEGIN{FS=","; OFS=","} { if ($1 ~ id) $8=input; print}' database.csv > 			Data.tmp && mv Data.tmp database.csv
				echo "Data Recorded"
				echo ""
				echo "Press (q) to Exit the program or (u) to go to update menu"
				read pre
        			case $pre in
           				 q) exit; break ;;
           				 u) update;;
				esac
			;;
			2)
				echo "Please enter the country's new city:"
				read new_city
				awk -v id=$enterID -v input="$new_city" 'BEGIN{FS=","; OFS=","} { if ($1 ~ id) $9=input; print}' database.csv > 			Data.tmp && mv Data.tmp database.csv
				echo "Data Recorded"
				echo ""
				echo "Press (q) to Exit the program or (u) to go to update menu"
				read pre
        			case $pre in
           				 q) exit; break ;;
           				 u) update;;
				esac
			;;
			*)
				echo 'Invalid input' >&2
				echo "Please choose the correct option:";;
			esac
			done
	;;
	7)
		echo "Please select the account type:"
		echo "1) Saving              2) Current"
		read ty
		case $ty in
			1) ty="Saving"
			awk -v id=$enterID -v input=$ty 'BEGIN{FS=","; OFS=","} { if ($1 ~ id) $10=input; print}' database.csv > 			Data.tmp && mv Data.tmp database.csv
			;;
			2) ty="Current"
			awk -v id=$enterID -v input=$ty 'BEGIN{FS=","; OFS=","} { if ($1 ~ id) $10=input; print}' database.csv > 			Data.tmp && mv Data.tmp database.csv
			echo "Data Recorded"
				echo ""
				echo "Press (q) to Exit the program or (u) to go to update menu"
				read pre
        			case $pre in
           				 q) exit; break ;;
           				 u) update;;
				esac
			;;
			esac
	;;
	8)
		echo "Enter the ammount:"
		read money
		awk -v id=$enterID -v input=$money 'BEGIN{FS=","; OFS=","} { if ($1 ~ id) $11=input; print}' database.csv > 			Data.tmp && mv Data.tmp database.csv
		echo "Data Recorded"
				echo ""
				echo "Press (q) to Exit the program or (u) to go to update menu"
				read pre
        			case $pre in
           				 q) exit; break ;;
           				 u) update;;
				esac
	;;
	*)
		echo  'Invalid input' >&2
		echo "Please choose the correct option:";;
		
	esac
	fi
	done
	fi
}

Tranc(){
	clear
	echo "Press (m) if you want to go to main menu"
	echo ""
	echo "Please enter the ID of your account:"
	read name_id
	if [ $name_id == "m" ]; then
	menu; casefun;
	else
	#sed -n 1p database.csv
	awk -v name="ID" 'BEGIN{FS=","; OFS="|"; NR==1} { if ($1 == name) { print } }' database.csv | head 
	 awk -v id=$name_id 'BEGIN{FS=","; OFS="|"; NR==1} { if ($1 == id) { print } }' database.csv | head
	echo ""
	echo "Press (r) if you want to renter the customer's ID"
	echo "Please choose one the options:"
	echo "1) Deposit"
	echo "2) Withdraw"
	echo "3) Transfer"
	while true; do
 	read money_tranc
	if [ $money_tranc == "r" ]; then
		Tranc
	else
	case $money_tranc in 
	1)
		echo "Please enter the amount you want deposit:"
		read amount
		curbalance=`awk -F, '$1 == '$name_id' {print $11}' database.csv`
		newbalance=`expr $amount + $curbalance`
		awk -v id=$name_id -v input=$newbalance 'BEGIN{FS=","; OFS=","} { if ($1 ~ id) $11=input; print}' database.csv > 			Data.tmp && mv Data.tmp database.csv
		echo "Amount Deposited to your account"
		echo "Your current balance is:"
		awk -v id=$name_id 'BEGIN{FS=","; OFS="|"; NR==1} { if ($1 == id) { print $11 } }' database.csv
		echo "Data Recorded"
				echo ""
				echo "Press (q) to Exit the program or (t) to go to Transaction menu"
				read pre
        			case $pre in
           				 q) exit; break ;;
           				 t) Tranc;;
				esac
	
	;;
	2)
		echo "Please enter amount you want to withdraw:"
		read amount
		current_balance=`awk -F, '$1 == '$name_id' {print $11}' database.csv`
		new_balance=`expr $current_balance - $amount `
		awk -v id=$name_id -v input="$new_balance" 'BEGIN{FS=","; OFS=","} { if ($1 ~ id) $11=input; print}' database.csv > 			Data.tmp && mv Data.tmp database.csv
		echo "Amount withdrawn from your account"
		echo "Your current balance is:"
		echo -e `awk -F, '$1 == '$name_id' {print $11}' database.csv`
		echo "Data Recorded"
				echo ""
				echo "Press (q) to Exit the program or (t) to go to Transaction menu"
				read pre
        			case $pre in
           				 q) exit; break ;;
           				 t) Tranc;;
				esac
	;;
	3)
		echo "Please enter the custoemr's ID:"
		read customer_id
		if grep -qF "$customer_id" database.csv;then
			echo ""
			echo -e `awk -F, '$1 == '$customer_id' {print $2 $3}' database.csv`
			echo "Enter the amount you want to transfer:"
			read transfer
			current_balance=`awk -F, '$1 == '$name_id' {print $11}' database.csv`
			new_balance=`expr  $current_balance - $transfer`
			awk -v id=$name_id -v input="$new_balance" 'BEGIN{FS=","; OFS=","} { if ($1 ~ id) $11=input; print}' database.csv > 			Data.tmp && mv Data.tmp database.csv
			ej=`awk -F, '$1 == '$customer_id' {print $11}' database.csv`
			newej=`expr $ej + $transfer`
			awk -v id=$customer_id -v input="$newej" 'BEGIN{FS=","; OFS=","} { if ($1 ~ id) $11=input; print}' database.csv > 			Data.tmp && mv Data.tmp database.csv
			echo "The amount is transfered"
			echo "Your current balance is:"
		echo -e `awk -F, '$1 == '$name_id' {print $11}' database.csv`
		echo ""
		echo -e "The`awk -F, '$1 == '$customer_id' {print $2 $3}' database.csv` is current balance is:"
		echo -e `awk -F, '$1 == '$customer_id' {print $11}' database.csv`
		echo "Data Recorded"
				echo ""
				echo "Press (q) to Exit the program or (t) to go to Transaction menu"
				read pre
        			case $pre in
           				 q) exit; break ;;
           				 t) Tranc;;
				esac
			
		else
   			echo "Sorry this customer does not have account"
				echo ""
				echo "Press (q) to Exit the program or (t) to go to Transaction menu"
				read pre
        			case $pre in
           				 q) exit; break ;;
           				 t) Tranc;;
				esac
		fi
	;;
	*)
		echo 'Invalid input' >&2
		echo "Please choose the correct option:";;
	esac
	fi
	done
	fi
}
delete(){
	echo "Press (m) to go to main menu and (d) to delete menu"
	echo ""
	echo "Please enter the id of the accoutn you want to delete:"
	read del
	awk -v name="ID" 'BEGIN{FS=","; OFS="|"; NR==1} { if ($1 == name) { print } }' database.csv
	echo ""
	 awk -v id=$del 'BEGIN{FS=","; OFS="|"; NR==1} { if ($1 == id) { print } }' database.csv
	echo ""
	if [ $del == "m" ]; then
	menu; casefun;
	elif [ $del == "d" ]; then
	delete;
	else
	sed -i '/\b\('$del'\)\b/d' ./database.csv
	echo -e "Account $del deleted"
	echo ""
	cat database.csv
	echo ""
	echo "Press (q) to Exit the program or (m) to go to Main Menu"
	read pre
        			case $pre in
           				 q) exit; break ;;
           				 m) menu; casefun;;
				esac
	fi
}
menu
casefun
