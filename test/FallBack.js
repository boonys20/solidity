const { expect } = require("chai");

describe("Throw Exception Contract", function() {

    let FallBack;
    let Test;
    let fallBackToken;
    let testToken;
    let owner1;
    let owner2;

    beforeEach(async function() {

        FallBack = await ethers.getContractFactory("FallBack");
        [owner1] = await ethers.getSigners();

        Test = await ethers.getContractFactory("Test");
        [owner2] = await ethers.getSigners();
        
        fallBackToken = await FallBack.deploy();
        testToken = await Test.deploy();

        await fallBackToken.deployed();
        await testToken.deployed();

    });

    describe("Process", function(){

        it(`should called to Foo`, async () => function(){
            const results = testToken.callToFoo();
            expect(result).to.equal("It's Foo() func.")
        })

        it(`should called to fallback`, async () => function(){
            const results = testToken.callToFallBack();
            expect(result).to.equal("It's fallback() func.")
        })

    });

});