pub fn square_of_sum(n: u32) -> u32 {
    let sum: u32 = (1..n + 1).into_iter().sum();
    sum * sum
}

pub fn sum_of_squares(n: u32) -> u32 {
    (1..n + 1).into_iter().map(|x| x * x).sum()
}

fn diff_simple(n: u32) -> u32 {
    square_of_sum(n) - sum_of_squares(n)
}

fn helper(list: &Vec<u32>) -> u32 {
    if list.len() == 0 {
        0
    } else {
        let all_but_last = list[0..list.len() - 1].to_vec();
        let last = list[list.len() - 1];
        let sum: u32 = all_but_last.iter().sum();
        last * sum + helper(&all_but_last)
    }
}
fn diff_algebra(n: u32) -> u32 {
    2 * helper(&(1..n + 1).collect())
}

pub fn difference(n: u32) -> u32 {
    diff_algebra(n)
}
