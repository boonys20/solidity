const { expect, assert, should } = require("chai");

describe("Exception Example", function () {

    let ShareWalletFactory;
    let SharedWallet;
    let AllowanceFactory;
    let Allowance;
    let owner;
    let addr1;
    let addr2;
    let addrs;

    beforeEach(async function () {

        ShareWalletFactory = await ethers.getContractFactory("SharedWallet");
        AllowanceFactory = await ethers.getContractFactory("Allowance");
        [owner, addr1, addr2, ...addrs] = await ethers.getSigners();
        SharedWallet = await ShareWalletFactory.deploy();
        Allowance = await AllowanceFactory.deploy();

    });

    describe("Transaction", function () {

        it("Should set the right owner", async function () {
            expect(await SharedWallet.owner()).to.equal(owner.address);
        });

        it("Should not withdraw by address 1, it's not right owner.", async function () {
            await expect(SharedWallet.connect(addr1).withdrawMoney(addr2.address, 200)).to.be.revertedWith("You are not allowed!");
        });

        it("Should have allowance for address 1", async function () {
            await Allowance.connect(owner).addAllowance(addr1.address,  ethers.utils.parseEther('0.1'));
            const addrBalance = await Allowance.allowance(addr1.address);
            expect(ethers.utils.parseEther('0.1')).to.equal(addrBalance);
        });

    });

});