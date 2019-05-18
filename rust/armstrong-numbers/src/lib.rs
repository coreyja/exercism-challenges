pub fn is_armstrong_number(num: u32) -> bool {
    let num_digits: u32 = num.to_string().len() as u32;
    let sum: u32 = num
        .to_string()
        .chars()
        .map(|x| x.to_digit(10).unwrap().pow(num_digits))
        .sum();
    sum == num
}
