//
//  TestData.swift
//  KianDigital
//
//  Created by mozhgan on 4/29/21.
//

import Foundation
import Combine
struct CachedData  {
    
}

extension CachedData : UserFetchable {
    func users() -> AnyPublisher<[Contact], NetworkError> {
        let string = "[{\"id\":\"1\",\"createdAt\":\"2021-04-25T04:14:34.567Z\",\"name\":\"Lelah\",\"avatar\":\"https://s3.amazonaws.com/uifaces/faces/twitter/kaelifa/128.jpg\",\"family\":\"Gutmann\",\"phoneNumber\":\"407.604.3782 x76001\"},{\"id\":\"2\",\"createdAt\":\"2021-04-25T13:49:47.752Z\",\"name\":\"Thea\",\"avatar\":\"https://s3.amazonaws.com/uifaces/faces/twitter/michaelbrooksjr/128.jpg\",\"family\":\"White\",\"phoneNumber\":\"441.395.3086\"},{\"id\":\"3\",\"createdAt\":\"2021-04-25T08:15:15.243Z\",\"name\":\"George\",\"avatar\":\"https://s3.amazonaws.com/uifaces/faces/twitter/itolmach/128.jpg\",\"family\":\"McLaughlin\",\"phoneNumber\":\"1-007-167-2655\"},{\"id\":\"4\",\"createdAt\":\"2021-04-24T20:24:45.239Z\",\"name\":\"Tomasa\",\"avatar\":\"https://s3.amazonaws.com/uifaces/faces/twitter/illyzoren/128.jpg\",\"family\":\"Jones\",\"phoneNumber\":\"(001) 434-0133 x97043\"},{\"id\":\"5\",\"createdAt\":\"2021-04-25T00:38:53.269Z\",\"name\":\"Madelyn\",\"avatar\":\"https://s3.amazonaws.com/uifaces/faces/twitter/baumann_alex/128.jpg\",\"family\":\"Ortiz\",\"phoneNumber\":\"1-174-034-7940\"},{\"id\":\"6\",\"createdAt\":\"2021-04-24T22:05:31.758Z\",\"name\":\"Jefferey\",\"avatar\":\"https://s3.amazonaws.com/uifaces/faces/twitter/anasnakawa/128.jpg\",\"family\":\"Kassulke\",\"phoneNumber\":\"312.226.6283\"},{\"id\":\"7\",\"createdAt\":\"2021-04-25T13:39:52.804Z\",\"name\":\"Cameron\",\"avatar\":\"https://s3.amazonaws.com/uifaces/faces/twitter/javorszky/128.jpg\",\"family\":\"Raynor\",\"phoneNumber\":\"635.650.1869 x6099\"}]"
        guard let data = string.data(using: String.Encoding.utf8) else {
            return Fail(error: NetworkError.parsing(description: "Invalid json")).eraseToAnyPublisher() }
        return Data.decodeArray(data)
    }
}
