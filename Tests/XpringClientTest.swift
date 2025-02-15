import XCTest
@testable import XpringKit

final class XpringClientTest: XCTestCase {
	static let wallet = Wallet(seed: "snYP7oArxKepd3GPDcrjMsJYiJeJB")!
	static let destinationAddress = "rU6K7V3Po4snVhBBaU29sesqs2qTQJWDw1"
	static let sendDrops = "20"
	static let sendAmount = Io_Xpring_XRPAmount.with {
		$0.drops = sendDrops
	}

	static let feeDrops = "15"
	static let balance = "1000"
	static let sequence: UInt64 = 2
	static let accountInfo = Io_Xpring_AccountInfo.with {
		$0.balance = Io_Xpring_XRPAmount.with {
			$0.drops = balance
		}
		$0.sequence = sequence
	}

	static let fee = Io_Xpring_Fee.with {
		$0.amount = Io_Xpring_XRPAmount.with {
			$0.drops = feeDrops
		}
	}

	static let engineResultCode: Int64 = 0
	static let submitTransactionResponse = Io_Xpring_SubmitSignedTransactionResponse.with {
		$0.engineResultCode = engineResultCode
	}

	// MARK: - Balance

	func testGetBalanceWithSuccess() {
		// GIVEN a Xpring client which will successfully return a balance from a mocked network call.
		let networkClient = FakeNetworkClient(
			accountInfoResult: .success(XpringClientTest.accountInfo),
			feeResult: .success(XpringClientTest.fee),
			submitSignedTransactionResult: .success(XpringClientTest.submitTransactionResponse)
		)
		let xpringClient = XpringClient(networkClient: networkClient)

		// WHEN the balance is requested.
		guard let xrpAmount = try? xpringClient.getBalance(for: .testAddress) else {
			XCTFail("Exception should not be thrown when trying to get a balance")
			return
		}

		// THEN the balance is correct.
		XCTAssertEqual(xrpAmount.drops, XpringClientTest.balance)
	}

	func testGetBalanceWithFailure() {
		// GIVEN a Xpring client which will throw an error when a balance is requested.
		let networkClient = FakeNetworkClient(
			accountInfoResult: .failure(XpringKitTestError.mockFailure),
			feeResult: .success(XpringClientTest.fee),
			submitSignedTransactionResult: .success(XpringClientTest.submitTransactionResponse)
		)
		let xpringClient = XpringClient(networkClient: networkClient)

		// WHEN the balance is requested THEN the error is thrown.
		XCTAssertThrowsError(try xpringClient.getBalance(for: .testAddress))
	}

	// MARK: - Send

	func testSendWithSuccess() {
		// GIVEN a Xpring client which will successfully return a balance from a mocked network call.
		let networkClient = FakeNetworkClient(
			accountInfoResult: .success(XpringClientTest.accountInfo),
			feeResult: .success(XpringClientTest.fee),
			submitSignedTransactionResult: .success(XpringClientTest.submitTransactionResponse)
		)
		let xpringClient = XpringClient(networkClient: networkClient)

		// WHEN XRP is sent.
		guard
			let result = try? xpringClient.send(
				XpringClientTest.sendAmount,
				to: XpringClientTest.destinationAddress,
				from: XpringClientTest.wallet)
		else {
			XCTFail("Exception should not be thrown when trying to send XRP")
			return
		}

		// THEN the engine result code is as expected.
		XCTAssertEqual(result.engineResultCode, XpringClientTest.engineResultCode)
	}

	func testSendWithAccountInfoFailure() {
		// GIVEN a Xpring client which will fail to return account info.
		let networkClient = FakeNetworkClient(
			accountInfoResult: .failure(XpringKitTestError.mockFailure),
			feeResult: .success(XpringClientTest.fee),
			submitSignedTransactionResult: .success(XpringClientTest.submitTransactionResponse)
		)
		let xpringClient = XpringClient(networkClient: networkClient)

		// WHEN a send is attempted then an error is thrown.
		XCTAssertThrowsError(try xpringClient.send(
			XpringClientTest.sendAmount,
			to: XpringClientTest.destinationAddress,
			from: XpringClientTest.wallet
		))
	}

	func testSendWithFeeFailure() {
		// GIVEN a Xpring client which will fail to return a fee.
		let networkClient = FakeNetworkClient(
			accountInfoResult: .success(XpringClientTest.accountInfo),
			feeResult: .failure(XpringKitTestError.mockFailure),
			submitSignedTransactionResult: .success(XpringClientTest.submitTransactionResponse)
		)
		let xpringClient = XpringClient(networkClient: networkClient)

		// WHEN a send is attempted then an error is thrown.
		XCTAssertThrowsError(try xpringClient.send(
			XpringClientTest.sendAmount,
			to: XpringClientTest.destinationAddress,
			from: XpringClientTest.wallet
		))
	}

	func testSendWithSubmitFailure() {
		// GIVEN a Xpring client which will fail to submit a transaction.
		let networkClient = FakeNetworkClient(
			accountInfoResult: .success(XpringClientTest.accountInfo),
			feeResult: .success(XpringClientTest.fee),
			submitSignedTransactionResult: .failure(XpringKitTestError.mockFailure)
		)
		let xpringClient = XpringClient(networkClient: networkClient)

		// WHEN a send is attempted then an error is thrown.
		XCTAssertThrowsError(try xpringClient.send(
			XpringClientTest.sendAmount,
			to: XpringClientTest.destinationAddress,
			from: XpringClientTest.wallet
		))
	}
}
