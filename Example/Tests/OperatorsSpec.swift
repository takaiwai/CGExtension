import Quick
import Nimble
import CGExtensions

class OperatorsSpec: QuickSpec {
    override func spec() {

        describe("CGPoint and CGFloat") {
            describe("+") {
                it("adds rhs to both x and y") {
                    let p = CGPoint(x: 12.3, y: 56.7) + 15.0
                    expect(p) == CGPoint(x: 27.3, y: 71.7)
                }
            }

            describe("-") {
                it("subtracts rhs from both x and y") {
                    let p = CGPoint(x: 12.3, y: 56.7) - 10.0
                    expect(p.x) ≈ 2.3
                    expect(p.y) ≈ 46.7
                }
            }

            describe("*") {
                it("returns a new CGPoint by multiplying") {
                    let p = CGPoint(10.0, 20.0) * 1.5
                    expect(p) == CGPoint(15.0, 30.0)
                }
            }

            describe("/") {
                it("returns a new CGPoint by dividing") {
                    let p = CGPoint(10.0, 20.0) / 2.0
                    expect(p) == CGPoint(5.0, 10.0)
                }
            }
        }

        describe("CGPoint and (CGFloat, CGFloat)") {
            describe("+") {
                it("adds each value of tuple separately to x and y") {
                    let s = CGPoint(x: 100.0, y: 50.0) + (20.5, 10.5)
                    expect(s) == CGPoint(x: 120.5, y: 60.5)
                }
            }

            describe("-") {
                it("subtracts each value of tuple separately from x and y") {
                    let s = CGPoint(x: 100.0, y: 50.0) - (20.5, 10.5)
                    expect(s) == CGPoint(x: 79.5, y: 39.5)
                }
            }

            describe("*") {
                it("multiplies x and y separately by each value of tuples") {
                    let s = CGPoint(x: 100.0, y: 50.0) * (1.5, 2.0)
                    expect(s) == CGPoint(x: 150.0, y: 100.0)
                }
            }

            describe("/") {
                it("divides x and y separately by each value of tuples") {
                    let s = CGPoint(x: 100.0, y: 50.0) / (2.0, 5.0)
                    expect(s) == CGPoint(x: 50.0, y: 10.0)
                }
            }
        }

        describe("CGPoint and CGPoint") {
            describe("-") {
                it("return a CGVector representing the difference between two points") {
                    let p1 = CGPoint(x: 10.0, y: 20.0)
                    let p2 = CGPoint(x: 100.5, y: 50.7)

                    let vector = p2 - p1

                    expect(vector.dx) ≈ 90.5
                    expect(vector.dy) ≈ 30.7
                }
            }
        }

        describe("CGPoint and CGVector") {
            describe("+") {
                it("return a CGPoint applying a CGVector") {
                    let point = CGPoint(x: 63.9, y: -32.5)
                    let vector = CGVector(dx: -10.0, dy: 25.0)

                    let result = point + vector

                    expect(result.x) ≈ 53.9
                    expect(result.y) ≈ -7.5
                }
            }

            describe("-") {
                it("return a CGPoint applying the inverse of CGVector") {
                    let point = CGPoint(x: 63.9, y: -32.5)
                    let vector = CGVector(dx: -10.0, dy: 25.0)

                    let result = point - vector

                    expect(result.x) ≈ 73.9
                    expect(result.y) ≈ -57.5
                }
            }
        }

        describe("CGSize and CGFloat") {
            describe("+") {
                it("adds right hand size to both width and height") {
                    let s = CGSize(100.0, 50.0) + 20.5
                    expect(s) == CGSize(120.5, 70.5)
                }
            }

            describe("-") {
                it("subtracts right hand size to both width and height") {
                    let s = CGSize(100.0, 50.0) - 20.5
                    expect(s) == CGSize(79.5, 29.5)
                }
            }
            
            describe("*") {
                it("multiplies right hand size to both width and height") {
                    let s = CGSize(100.0, 50.0) * 1.5
                    expect(s) == CGSize(150.0, 75.0)
                }
            }
            
            describe("/") {
                it("divides right hand size to both width and height") {
                    let s = CGSize(100.0, 50.0) / 2.0
                    expect(s) == CGSize(50.0, 25.0)
                }
            }
        }
        
        describe("CGSize and (CGFloat, CGFloat)") {
            describe("+") {
                it("adds each value of tuple separately to width and height") {
                    let s = CGSize(100.0, 50.0) + (20.5, 10.5)
                    expect(s) == CGSize(120.5, 60.5)
                }
            }
            
            describe("-") {
                it("subtracts each value of tuple separately from width and height") {
                    let s = CGSize(100.0, 50.0) - (20.5, 10.5)
                    expect(s) == CGSize(79.5, 39.5)
                }
            }
            
            describe("*") {
                it("multiplies width and height separately by each value of tuples") {
                    let s = CGSize(100.0, 50.0) * (1.5, 2.0)
                    expect(s) == CGSize(150.0, 100.0)
                }
            }
            
            describe("/") {
                it("divides width and height separately by each value of tuples") {
                    let s = CGSize(100.0, 50.0) / (2.0, 5.0)
                    expect(s) == CGSize(50.0, 10.0)
                }
            }
        }

        describe("CGVector and CGVector") {
            describe("+") {
                it("return a CGVector by adding the right hand side") {
                    let v1 = CGVector(dx: 63.9, dy: -32.5)
                    let v2 = CGVector(dx: -10.0, dy: 25.0)

                    let result = v1 + v2

                    expect(result.dx) ≈ 53.9
                    expect(result.dy) ≈ -7.5
                }
            }

            describe("-") {
                it("return a CGVector by adding the right hand side") {
                    let v1 = CGVector(dx: 63.9, dy: -32.5)
                    let v2 = CGVector(dx: -10.0, dy: 25.0)

                    let result = v1 - v2

                    expect(result.dx) ≈ 73.9
                    expect(result.dy) ≈ -57.5
                }
            }

            describe("⋅") {
                it("returns the dot product between two vectors") {
                    let v1 = CGVector(dx: 10.5, dy: 6.0)
                    let v2 = CGVector(dx: 26, dy: 18.0)
                    let result = v1 ⋅ v2

                    expect(result) ≈ 381.0
                }
            }
        }

        describe("CGVector and CGFloat") {
            describe("+") {
                it("adds rhs to both dx and dy") {
                    let v = CGVector(dx: 12.3, dy: 56.7) + 15.0
                    expect(v) == CGVector(dx: 27.3, dy: 71.7)
                }
            }

            describe("-") {
                it("subtracts rhs from both dx and dy") {
                    let v = CGVector(dx: 12.3, dy: 56.7) - 10.0
                    expect(v.dx) ≈ 2.3
                    expect(v.dy) ≈ 46.7
                }
            }

            describe("*") {
                it("returns a new CGVector by multiplying") {
                    let v = CGVector(dx: 10.0, dy: 20.0) * 1.5
                    expect(v) == CGVector(dx: 15.0, dy: 30.0)
                }
            }

            describe("/") {
                it("returns a new CGVector by dividing") {
                    let v = CGVector(dx: 10.0, dy: 20.0) / 2.0
                    expect(v) == CGVector(dx: 5.0, dy: 10.0)
                }
            }
        }

        describe("CGVector and (CGFloat, CGFloat)") {
            describe("+") {
                it("adds each value of tuple separately to dx and dy") {
                    let s = CGVector(dx: 100.0, dy: 50.0) + (20.5, 10.5)
                    expect(s) == CGVector(dx: 120.5, dy: 60.5)
                }
            }

            describe("-") {
                it("subtracts each value of tuple separately from dx and dy") {
                    let s = CGVector(dx: 100.0, dy: 50.0) - (20.5, 10.5)
                    expect(s) == CGVector(dx: 79.5, dy: 39.5)
                }
            }

            describe("*") {
                it("multiplies dx and dy separately by each value of tuples") {
                    let s = CGVector(dx: 100.0, dy: 50.0) * (1.5, 2.0)
                    expect(s) == CGVector(dx: 150.0, dy: 100.0)
                }
            }

            describe("/") {
                it("divides dx and dy separately by each value of tuples") {
                    let s = CGVector(dx: 100.0, dy: 50.0) / (2.0, 5.0)
                    expect(s) == CGVector(dx: 50.0, dy: 10.0)
                }
            }
        }

    }
}
