import tested from './hashFromStringUnicodes'

test('range is a number', () => {
    expect(typeof tested.range).toBe("number")
    expect(tested.range).toBeGreaterThan(0)
})

test('a number returns', () => {
    expect(typeof tested.hash("string")).toBe("number")
})

test('a diffrent number returns from diffrent strings',
()=>{
    const exampleA = tested.hash("exampleA")
    const exampleB = tested.hash("exampleB")
    expect(exampleA).not.toEqual(exampleB)
})

test("for the same string returns same number",()=>{
    const exampleA = tested.hash("exampleA")
    const exampleB = tested.hash("exampleB")
    const exampleA_again = tested.hash("exampleA")
    expect(exampleA).toEqual(exampleA_again)
})