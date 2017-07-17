
function mainFunc {
	$PreviousCommitNumber = Get-Content .\COMMIT
	$MostRecentCommitHead = git ls-remote "https://github.com/kavyasribasavaraj/DevOps" HEAD
	$MostRecentCommitNumber = $MostRecentCommitHead.split("		")[0]
	
	if($PreviousCommitNumber -eq $MostRecentCommitNumber){
		echo "Do not deploy. Run again."
		Start-sleep -s 10
		mainFunc
	}else{
		.\Batch.bat
		echo "Deploy"
		Clear-Content COMMIT
		$MostRecentCommitNumber >> 'COMMIT'
		Start-sleep -s 10
		mainFunc
	}
}

mainFunc

