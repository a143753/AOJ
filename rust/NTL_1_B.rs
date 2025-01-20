use std::io::BufRead;

fn read_row_vec<T: std::str::FromStr>(reader: &mut std::io::StdinLock) -> Vec<T>
where
    <T as std::str::FromStr>::Err: std::fmt::Debug,
{
    let mut row = Vec::new();
    reader.lines().take(1).for_each(|line| {
        row = line
            .unwrap()
            .split_whitespace()
            .map(|x| x.parse::<T>().unwrap())
            .collect::<Vec<_>>();
    });
    row
}

fn f(m: u128, n: u128, r: u128) -> u128 {
    if n == 0 {
        1 % r
    } else if n == 1 {
        m % r
    } else if n % 2 == 0 {
        let a = f(m, n / 2, r);
        a * a % r
    } else {
        let a = f(m, n / 2, r);
        a * a * m % r
    }
}

fn main() {
    let reader = std::io::stdin();
    let mn = read_row_vec::<u128>(&mut reader.lock());

    let m = mn[0];
    let n = mn[1];

    let a = f(m, n, 1000000007);
    println!("{}", a);
}
