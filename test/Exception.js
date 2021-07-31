const { expect } = require("chai");

describe("Exception Example", function () {

    let Contract;
    let Token;
    let owner;
    let addr1;
    let addr2;
    let addrs;

    beforeEach(async function () {
        Contract = await ethers.getContractFactory("Exception");
        [owner, addr1, addr2, ...addrs] = await ethers.getSigners();
        Token = await Contract.deploy();
        await Token.deployed();
    });

    describe("Transactions", function () {

        it(`should deposit 50 eth to weth contract:`, async () => {
            await Token.receiveMoney({ value: ethers.utils.parseEther("50") });
            const addrBalance = await Token.balanceReceived(
                owner.address
            );
            expect(addrBalance).to.equal(ethers.utils.parseEther("50"));
        });

        it("should withdraw money 20 eth ", async function () {
            await Token.receiveMoney({ value: ethers.utils.parseEther("20") });
            await Token.withDrawMoney(owner.address, ethers.utils.parseEther("20"));
            const addrBalance = await Token.balanceReceived(
                owner.address
            );
            expect(addrBalance).to.equal(ethers.utils.parseEther("0"));
        });

        it("should inform user don't hava enough ether", async function () {
            await Token.receiveMoney({ value: ethers.utils.parseEther("10") });
            const result = Token.withDrawMoney(owner.address, ethers.utils.parseEther("20"));
            await expect(result).revertedWith("Not Enough Funds, aborting.")
        });

    });

    describe("Non-Transactions", function () {
        it("should show result without any gas required, test pure attibute.", async function(){
            result = await Token.convertWeiToEther(10**8)
       });
    });

});