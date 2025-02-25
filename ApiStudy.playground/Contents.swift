import Foundation

// 안쓰고 싶은 요소들을 지우면 디코딩 할때 안가져옴.
struct ItemData {
    let id: Int
    let title: String
    let price: Double
    let description: String
    let category: String
    let iamge: String
    let rating: ItemDataRating

    /*
     enum CodingKey는
     예를들어 rating이 item_rating처럼 있는 경우 swift에서는 스네이크 케이스를 안쓰는데
     itemRating처럼 바꾸고 싶을 때 사용
     = 컨벤션 맞출 때 사용.
     */
    enum CodingKeys: String, CodingKey {
        case id, title, price, description,category, image
        case itemRating = "item_rating"
        
    }
}

struct ItemDataRating {
    let rate: Double
    let count: Int
}


