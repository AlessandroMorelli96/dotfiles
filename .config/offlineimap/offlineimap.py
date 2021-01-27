from subprocess import check_output
import re
def oimaptransfolder_gmail(foldername):
    if(foldername == "INBOX"):
        retval = "gmail"
    else:
        retval = "gmail." + foldername
    retval = re.sub("/", ".", retval)
    return retval

def oimaptransfolder_polito(foldername):
    if(foldername == "INBOX"):
        retval = "polito"
    else:
        retval = "polito." + foldername
    retval = re.sub("/", ".", retval)
    return retval

def get_passGMAIL():
    return check_output("pass show Mail/Gmail", shell=True).splitlines()[2]

def get_accountGMAIL():
    return check_output("pass show Mail/Gmail", shell=True).splitlines()[1]

def get_passPOLITO():
    return check_output("pass show Mail/Polito", shell=True).splitlines()[0]

def get_accountPOLITO():
    return check_output("pass show Mail/Polito", shell=True).splitlines()[1]

#def oimaptransfolder_acc2(foldername):
#    if(foldername == "INBOX"):
#        retval = "acc2"
#    else:
#        retval = "acc2." + foldername
#    retval = re.sub("/", ".", retval)
#    return retval
