fn is_prime(n: u32, primes: &Vec<u32>) -> bool {
    for x in primes {
        if n % x == 0 {
            return false;
        }
    }
    true
}

pub fn nth(n: u32) -> u32 {
    let mut primes: Vec<u32> = Vec::new();
    let mut i = 1;
    while primes.len() <= n as usize {
        i += 1;
        if is_prime(i, &primes) {
            primes.push(i);
        }
    }
    i
}
