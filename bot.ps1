
function mainFunc {
	$PreviousCommitNumber = Get-Content .\COMMIT
	$MostRecentCommitHead = git ls-remote "<Replace this with the repository to be monitored" HEAD
	$MostRecentCommitNumber = $MostRecentCommitHead.split("		")[0]
	
	if($PreviousCommitNumber -eq $MostRecentCommitNumber){
		echo "Do not deploy. Run again."
		Start-sleep -s 10
		mainFunc
	}else{
		#Your deployment script comes here
		echo "Deploy"
		Clear-Content COMMIT
		$MostRecentCommitNumber >> 'COMMIT'
		Start-sleep -s 10
		mainFunc
	}
}

mainFunc

