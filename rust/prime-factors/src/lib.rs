pub fn factors(n: u64) -> Vec<u64> {
    let mut factors: Vec<u64> = vec![];
    let mut x = n;
    let mut i = 2;
    while x > 1 {
        if x % i == 0 {
            x = x / i;
            factors.push(i);
        } else {
            i += 1;
        }
    }
    factors
}
