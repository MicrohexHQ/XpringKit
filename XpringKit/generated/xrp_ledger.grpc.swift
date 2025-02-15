//
// DO NOT EDIT.
//
// Generated by the protocol buffer compiler.
// Source: xrp_ledger.proto
//

//
// Copyright 2018, gRPC Authors All rights reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
import Dispatch
import Foundation
import SwiftGRPC
import SwiftProtobuf

internal protocol Io_Xpring_XRPLedgerGetAccountInfoCall: ClientCallUnary {}

fileprivate final class Io_Xpring_XRPLedgerGetAccountInfoCallBase: ClientCallUnaryBase<Io_Xpring_GetAccountInfoRequest, Io_Xpring_AccountInfo>, Io_Xpring_XRPLedgerGetAccountInfoCall {
  override class var method: String { return "/io.xpring.XRPLedger/GetAccountInfo" }
}

internal protocol Io_Xpring_XRPLedgerGetFeeCall: ClientCallUnary {}

fileprivate final class Io_Xpring_XRPLedgerGetFeeCallBase: ClientCallUnaryBase<Io_Xpring_GetFeeRequest, Io_Xpring_Fee>, Io_Xpring_XRPLedgerGetFeeCall {
  override class var method: String { return "/io.xpring.XRPLedger/GetFee" }
}

internal protocol Io_Xpring_XRPLedgerSubmitSignedTransactionCall: ClientCallUnary {}

fileprivate final class Io_Xpring_XRPLedgerSubmitSignedTransactionCallBase: ClientCallUnaryBase<Io_Xpring_SubmitSignedTransactionRequest, Io_Xpring_SubmitSignedTransactionResponse>, Io_Xpring_XRPLedgerSubmitSignedTransactionCall {
  override class var method: String { return "/io.xpring.XRPLedger/SubmitSignedTransaction" }
}


/// Instantiate Io_Xpring_XRPLedgerServiceClient, then call methods of this protocol to make API calls.
internal protocol Io_Xpring_XRPLedgerService: ServiceClient {
  /// Synchronous. Unary.
  func getAccountInfo(_ request: Io_Xpring_GetAccountInfoRequest, metadata customMetadata: Metadata) throws -> Io_Xpring_AccountInfo
  /// Asynchronous. Unary.
  @discardableResult
  func getAccountInfo(_ request: Io_Xpring_GetAccountInfoRequest, metadata customMetadata: Metadata, completion: @escaping (Io_Xpring_AccountInfo?, CallResult) -> Void) throws -> Io_Xpring_XRPLedgerGetAccountInfoCall

  /// Synchronous. Unary.
  func getFee(_ request: Io_Xpring_GetFeeRequest, metadata customMetadata: Metadata) throws -> Io_Xpring_Fee
  /// Asynchronous. Unary.
  @discardableResult
  func getFee(_ request: Io_Xpring_GetFeeRequest, metadata customMetadata: Metadata, completion: @escaping (Io_Xpring_Fee?, CallResult) -> Void) throws -> Io_Xpring_XRPLedgerGetFeeCall

  /// Synchronous. Unary.
  func submitSignedTransaction(_ request: Io_Xpring_SubmitSignedTransactionRequest, metadata customMetadata: Metadata) throws -> Io_Xpring_SubmitSignedTransactionResponse
  /// Asynchronous. Unary.
  @discardableResult
  func submitSignedTransaction(_ request: Io_Xpring_SubmitSignedTransactionRequest, metadata customMetadata: Metadata, completion: @escaping (Io_Xpring_SubmitSignedTransactionResponse?, CallResult) -> Void) throws -> Io_Xpring_XRPLedgerSubmitSignedTransactionCall

}

internal extension Io_Xpring_XRPLedgerService {
  /// Synchronous. Unary.
  func getAccountInfo(_ request: Io_Xpring_GetAccountInfoRequest) throws -> Io_Xpring_AccountInfo {
    return try self.getAccountInfo(request, metadata: self.metadata)
  }
  /// Asynchronous. Unary.
  @discardableResult
  func getAccountInfo(_ request: Io_Xpring_GetAccountInfoRequest, completion: @escaping (Io_Xpring_AccountInfo?, CallResult) -> Void) throws -> Io_Xpring_XRPLedgerGetAccountInfoCall {
    return try self.getAccountInfo(request, metadata: self.metadata, completion: completion)
  }

  /// Synchronous. Unary.
  func getFee(_ request: Io_Xpring_GetFeeRequest) throws -> Io_Xpring_Fee {
    return try self.getFee(request, metadata: self.metadata)
  }
  /// Asynchronous. Unary.
  @discardableResult
  func getFee(_ request: Io_Xpring_GetFeeRequest, completion: @escaping (Io_Xpring_Fee?, CallResult) -> Void) throws -> Io_Xpring_XRPLedgerGetFeeCall {
    return try self.getFee(request, metadata: self.metadata, completion: completion)
  }

  /// Synchronous. Unary.
  func submitSignedTransaction(_ request: Io_Xpring_SubmitSignedTransactionRequest) throws -> Io_Xpring_SubmitSignedTransactionResponse {
    return try self.submitSignedTransaction(request, metadata: self.metadata)
  }
  /// Asynchronous. Unary.
  @discardableResult
  func submitSignedTransaction(_ request: Io_Xpring_SubmitSignedTransactionRequest, completion: @escaping (Io_Xpring_SubmitSignedTransactionResponse?, CallResult) -> Void) throws -> Io_Xpring_XRPLedgerSubmitSignedTransactionCall {
    return try self.submitSignedTransaction(request, metadata: self.metadata, completion: completion)
  }

}

internal final class Io_Xpring_XRPLedgerServiceClient: ServiceClientBase, Io_Xpring_XRPLedgerService {
  /// Synchronous. Unary.
  internal func getAccountInfo(_ request: Io_Xpring_GetAccountInfoRequest, metadata customMetadata: Metadata) throws -> Io_Xpring_AccountInfo {
    return try Io_Xpring_XRPLedgerGetAccountInfoCallBase(channel)
      .run(request: request, metadata: customMetadata)
  }
  /// Asynchronous. Unary.
  @discardableResult
  internal func getAccountInfo(_ request: Io_Xpring_GetAccountInfoRequest, metadata customMetadata: Metadata, completion: @escaping (Io_Xpring_AccountInfo?, CallResult) -> Void) throws -> Io_Xpring_XRPLedgerGetAccountInfoCall {
    return try Io_Xpring_XRPLedgerGetAccountInfoCallBase(channel)
      .start(request: request, metadata: customMetadata, completion: completion)
  }

  /// Synchronous. Unary.
  internal func getFee(_ request: Io_Xpring_GetFeeRequest, metadata customMetadata: Metadata) throws -> Io_Xpring_Fee {
    return try Io_Xpring_XRPLedgerGetFeeCallBase(channel)
      .run(request: request, metadata: customMetadata)
  }
  /// Asynchronous. Unary.
  @discardableResult
  internal func getFee(_ request: Io_Xpring_GetFeeRequest, metadata customMetadata: Metadata, completion: @escaping (Io_Xpring_Fee?, CallResult) -> Void) throws -> Io_Xpring_XRPLedgerGetFeeCall {
    return try Io_Xpring_XRPLedgerGetFeeCallBase(channel)
      .start(request: request, metadata: customMetadata, completion: completion)
  }

  /// Synchronous. Unary.
  internal func submitSignedTransaction(_ request: Io_Xpring_SubmitSignedTransactionRequest, metadata customMetadata: Metadata) throws -> Io_Xpring_SubmitSignedTransactionResponse {
    return try Io_Xpring_XRPLedgerSubmitSignedTransactionCallBase(channel)
      .run(request: request, metadata: customMetadata)
  }
  /// Asynchronous. Unary.
  @discardableResult
  internal func submitSignedTransaction(_ request: Io_Xpring_SubmitSignedTransactionRequest, metadata customMetadata: Metadata, completion: @escaping (Io_Xpring_SubmitSignedTransactionResponse?, CallResult) -> Void) throws -> Io_Xpring_XRPLedgerSubmitSignedTransactionCall {
    return try Io_Xpring_XRPLedgerSubmitSignedTransactionCallBase(channel)
      .start(request: request, metadata: customMetadata, completion: completion)
  }

}

/// To build a server, implement a class that conforms to this protocol.
/// If one of the methods returning `ServerStatus?` returns nil,
/// it is expected that you have already returned a status to the client by means of `session.close`.
internal protocol Io_Xpring_XRPLedgerProvider: ServiceProvider {
  func getAccountInfo(request: Io_Xpring_GetAccountInfoRequest, session: Io_Xpring_XRPLedgerGetAccountInfoSession) throws -> Io_Xpring_AccountInfo
  func getFee(request: Io_Xpring_GetFeeRequest, session: Io_Xpring_XRPLedgerGetFeeSession) throws -> Io_Xpring_Fee
  func submitSignedTransaction(request: Io_Xpring_SubmitSignedTransactionRequest, session: Io_Xpring_XRPLedgerSubmitSignedTransactionSession) throws -> Io_Xpring_SubmitSignedTransactionResponse
}

extension Io_Xpring_XRPLedgerProvider {
  internal var serviceName: String { return "io.xpring.XRPLedger" }

  /// Determines and calls the appropriate request handler, depending on the request's method.
  /// Throws `HandleMethodError.unknownMethod` for methods not handled by this service.
  internal func handleMethod(_ method: String, handler: Handler) throws -> ServerStatus? {
    switch method {
    case "/io.xpring.XRPLedger/GetAccountInfo":
      return try Io_Xpring_XRPLedgerGetAccountInfoSessionBase(
        handler: handler,
        providerBlock: { try self.getAccountInfo(request: $0, session: $1 as! Io_Xpring_XRPLedgerGetAccountInfoSessionBase) })
          .run()
    case "/io.xpring.XRPLedger/GetFee":
      return try Io_Xpring_XRPLedgerGetFeeSessionBase(
        handler: handler,
        providerBlock: { try self.getFee(request: $0, session: $1 as! Io_Xpring_XRPLedgerGetFeeSessionBase) })
          .run()
    case "/io.xpring.XRPLedger/SubmitSignedTransaction":
      return try Io_Xpring_XRPLedgerSubmitSignedTransactionSessionBase(
        handler: handler,
        providerBlock: { try self.submitSignedTransaction(request: $0, session: $1 as! Io_Xpring_XRPLedgerSubmitSignedTransactionSessionBase) })
          .run()
    default:
      throw HandleMethodError.unknownMethod
    }
  }
}

internal protocol Io_Xpring_XRPLedgerGetAccountInfoSession: ServerSessionUnary {}

fileprivate final class Io_Xpring_XRPLedgerGetAccountInfoSessionBase: ServerSessionUnaryBase<Io_Xpring_GetAccountInfoRequest, Io_Xpring_AccountInfo>, Io_Xpring_XRPLedgerGetAccountInfoSession {}

internal protocol Io_Xpring_XRPLedgerGetFeeSession: ServerSessionUnary {}

fileprivate final class Io_Xpring_XRPLedgerGetFeeSessionBase: ServerSessionUnaryBase<Io_Xpring_GetFeeRequest, Io_Xpring_Fee>, Io_Xpring_XRPLedgerGetFeeSession {}

internal protocol Io_Xpring_XRPLedgerSubmitSignedTransactionSession: ServerSessionUnary {}

fileprivate final class Io_Xpring_XRPLedgerSubmitSignedTransactionSessionBase: ServerSessionUnaryBase<Io_Xpring_SubmitSignedTransactionRequest, Io_Xpring_SubmitSignedTransactionResponse>, Io_Xpring_XRPLedgerSubmitSignedTransactionSession {}

