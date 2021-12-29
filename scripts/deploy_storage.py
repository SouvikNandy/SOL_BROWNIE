from brownie import SimpleStorage
from scripts import utils

def deploy_storage():
    account = utils.get_account()
    s_storage = SimpleStorage.deploy({"from": account})
    print("deployed on  ", s_storage.address)
    val = s_storage.retrieve()
    print("initial value ", val)
    txn = s_storage.store(15, {"from": account})
    txn.wait(1) # wait for number of block
    val = s_storage.retrieve()
    print("updated value ", val)


def main():
    deploy_storage()
