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

fn f(a: i32, b: i32) -> i32 {
    a % (b + 1)
}

fn main() {
    let stdin = std::io::stdin();
    let mut reader = stdin.lock();

    let v: Vec<i32> = read_row_vec(&mut reader);

    let a = f(v[0], v[1]);

    println!("{}", a);
}
