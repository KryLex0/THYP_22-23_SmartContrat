import Web3 from "web3";

const web3 = new Web3(windows.web3.currentProvider);

export default web3;




/*
// ...
const $ = (sel) => {
    return document.querySelector(sel)
}
*/
/**
 * Gets account details
 *//*
async function getAccounts() {
    const res = []
    const accounts = await web3.eth.getAccounts()
    for (const account of accounts) {
        const balanceWei = await web3.eth.getBalance(account)
        const balance = web3.utils.fromWei(balanceWei)
        res.push({
            account,
            balance,
        })
    }
    return res
}

async function updateBalance() {
    const accounts = await getAccounts()
    $('#wallet').innerText = web3.utils.toWei(accounts[1].balance)
    $('#address-wallet').innerText = accounts[1].account
}


window.addEventListener('load', async () => {
    await updateBalance()
})
*/