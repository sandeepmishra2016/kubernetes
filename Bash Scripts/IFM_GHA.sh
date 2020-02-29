#!/usr/bin/env bash

#======================================================================
# Variables
#======================================================================
ifmver=IFM420
stencd=GHA
activeMQ=/data/${ifmver}_${stencd} ###/data/IFM420_GHA/###
sendTo="ML_GTS_Product_Ops_HostedServices"
####env=PROD
ltencd=FairIsaac${stencd}1  ##FairIsaacGHA1
model=(Dental,Pharmacy)
modelcd=(DL,PH)

waitMins=3
AZ=$activeMQ/${ltencd}/automation/archivezone  ###AZ(ArchieveZone)=/data/IFM420_GHA/FairIsaacGHA1/automation/archivezone###

scriptDir=$activeMQ/scripts/${stencd}     ###ScriptDirectory=/data/IFM420_GHA/scripts/GHA/###

logDir=$scriptDir/LOGS                     ### LogDirectory=/data/IFM420_GHA/scripts/GHA/LOGS###

stageDir=$activeMQ/${ltencd}/outstaging    ###FileStageingDirectory=/data/IFM420_GHA/FairIsaacGHA1/outstaging###

DZ=/data/IFM_DROPZONE/GHA/

#======================================================================




stagefile() {

if [[ -f $(ls $DZ/CL*) ]]; then

mv /data/IFM_DROPZONE/GHA/CL* /data/IFM_DROPZONE/GHA/Medical
mv /data/IFM_DROPZONE/GHA/CL* /data/IFM_DROPZONE/Medical/archive

mv /data/IFM_DROPZONE/GHA/DL* /data/IFM_DROPZONE/GHA/Dental
mv /data/IFM_DROPZONE/GHA/DL* /data/IFM_DROPZONE/GHA/Dental/archive

mv /data/IFM_DROPZONE/GHA/PH* /data/IFM_DROPZONE/GHA/Pharmacy
mv /data/IFM_DROPZONE/GHA/PH* /data/IFM_DROPZONE/GHA/Pharmacy/archive
fi
}

chkTriggerDir() {

   if ! [[ -d "$DZ/${model}/triggers" ]]; then
      echo "`date`: Trigger directory does not exist! Creating trigger directory..."
      umask 000
      mkdir triggers
      mv /data/IFM_DROPZONE/GHA/Dental/DL20*.trg* /data/IFM_DROPZONE/GHA/Dental/triggers/
   else
      echo "`date`: Sending triggers to the triggers directory..."
        mv /data/IFM_DROPZONE/GHA/Dental/DL20*.trg* /data/IFM_DROPZONE/GHA/Dental/triggers/
   fi

}



