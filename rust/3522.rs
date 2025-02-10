use std::io::{self, BufRead};
use std::str::FromStr;

fn read_matrix<T: std::str::FromStr>(
    reader: &mut std::io::StdinLock,
    n: usize,
    s: char,
) -> Vec<Vec<T>>
where
    <T as std::str::FromStr>::Err: std::fmt::Debug,
{
    fn sub<T: std::str::FromStr>(line: &str, s: char) -> Vec<T>
    where
        <T as FromStr>::Err: std::fmt::Debug,
    {
        if s == ' ' {
            line.split_whitespace()
                .map(|x| x.parse::<T>().unwrap())
                .collect::<Vec<_>>()
        } else {
            line.split(s)
                .map(|x| x.parse::<T>().unwrap())
                .collect::<Vec<_>>()
        }
    }

    let mut matrix = Vec::new();
    if n == 0 {
        reader.lines().for_each(|line| {
            let dt = sub::<T>(&line.unwrap(), s);
            matrix.push(dt);
        });
    } else {
        reader.lines().take(n as usize).for_each(|line| {
            let dt = sub::<T>(&line.unwrap(), s);
            matrix.push(dt);
        });
    }
    matrix
}

fn main() {
    let stdin = io::stdin();
    let mut reader = stdin.lock();

    let d = read_matrix::<i64>(&mut reader, 0, ' ');

    let h1 = d[0][0];
    let w1 = d[0][1];
    let h2 = d[1][0];
    let w2 = d[1][1];

    let h = h1 / h2 + (h1 % h2 != 0) as i64;
    let w = w1 / w2 + (w1 % w2 != 0) as i64;
    println!("{}", h * w);
}
