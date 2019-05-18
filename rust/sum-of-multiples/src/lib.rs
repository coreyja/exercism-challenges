fn multiple_of_any(x: u32, factors: &Vec<u32>) -> bool {
    for i in factors {
        if x % i == 0 {
            return true;
        }
    }
    false
}

pub fn sum_of_multiples(limit: u32, factors: &[u32]) -> u32 {
    let list: Vec<u32> = (1..limit).collect();
    let zero_removed = factors.iter().map(|x| *x).filter(|x| *x != 0).collect();

    list.iter()
        .filter(|x| multiple_of_any(**x, &zero_removed))
        .sum()
}
