// ==========================================================================
// = Copyright (C) 2013/2015 Seagull Project - Contrato Ref: 20131034063    =
// = -----------------------------------------------------------------------=
// = Parceiros:
// =  - Critical Software - CSW
// =  - Força Aérea Portuguesa - FAP
// =  - Marinha Portuguse - MP 
// =  - Instituto Superior Técnico - IST/ISR
// =  - Faculdade de Eng. do Porto - FEUP
// ==========================================================================
// Change Log:
// -------------------------------------------------------------------------=
// Date       / Author              /Description
// ==========================================================================
// Project: seagull_autopilot
// Date:    2014/02/17
// Author:  Pedro Marques da Silva  
// -------------------------------------------------------------------------=
// Description: test_AutopilotComms.cpp
//
// ==========================================================================

#include <seagull_autopilot/AutopilotComms.h>
#include <gtest/gtest.h>

class AutopilotCommsTest: public testing::Test {
protected:

	virtual void SetUp() {

	}
	virtual void TearDown() {
	}

};

// Declare a test
TEST_F(AutopilotCommsTest, testCase1) {
	ASSERT_EQ(1, 1);
}

// Declare another test
TEST_F(AutopilotCommsTest, testCase2) {

}

// Run all the tests that were declared with TEST()
int main(int argc, char **argv) {

	testing::InitGoogleTest(&argc, argv);

	return RUN_ALL_TESTS();
}
