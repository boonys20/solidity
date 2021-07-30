const { expect } = require("chai");

describe("WillThrow Contract", function() {

    let Contract1;
    let Contract2;
    let Token1;
    let Token2;
    let owner1;
    let owner2;

    beforeEach(async function() {

        Contract1 = await ethers.getContractFactory("ErrorHandling");
        [owner1] = await ethers.getSigners();

        Contract2 = await ethers.getContractFactory("WillThrow");
        [owner2] = await ethers.getSigners();
        
        Token1 = await Contract1.deploy();
        Token2 = await Contract2.deploy();

        await Token1.deployed();
        await Token2.deployed();

    });

    describe("Process", function(){
        it(`should throw error message when call aFunction`, async () => function(){
            const results = Token.catchError();
            expect(result).to.equal("Not Enough Funds, aborting.")
        })
    });

});