import Foundation

final class FillWithColor {
    
    func fillWithColor(_ image: [[Int]], _ row: Int, _ column: Int, _ newColor: Int) -> [[Int]] {

        if image.count == 0 || row > image.count - 1 || column < 1 || column > image[0].count - 1 || newColor > 65536 || image.count < 1 || image[0].count > 50 {
            return image
        }
        else {
            let oldColor = image[row][column]
            var queue = [(row,column)]
            var newImage = image

            while !queue.isEmpty {
                let coord = queue[0]
                queue.remove(at: 0)
                newImage[coord.0][coord.1] = newColor
                if coord.0 < newImage.count - 1 {
                    if newImage[coord.0 + 1][coord.1] == oldColor {
                        newImage[coord.0 + 1][coord.1] = newColor
                        queue.append((coord.0 + 1, coord.1))
                    }
                }
                if coord.1 < newImage[0].count - 1 {
                    if newImage[coord.0][coord.1 + 1] == oldColor {
                        newImage[coord.0][coord.1 + 1] = newColor
                        queue.append((coord.0, coord.1 + 1))
                    }
                }
                if coord.0 > 0 {
                    if newImage[coord.0 - 1][coord.1] == oldColor {
                        newImage[coord.0 - 1][coord.1] = newColor
                        queue.append((coord.0 - 1, coord.1))
                    }
                }
                if coord.1 > 0 {
                    if newImage[coord.0][coord.1 - 1] == oldColor {
                        newImage[coord.0][coord.1 - 1] = newColor
                        queue.append((coord.0, coord.1 - 1))
                    }
                }
            }
            return newImage
        }
    }
}
