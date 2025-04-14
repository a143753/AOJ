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

fn f(d: i32, x: i32, y: i32) -> bool {
    d >= x.abs() + y.abs()
}

fn main() {
    let stdin = std::io::stdin();
    let mut reader = stdin.lock();

    let dxy: Vec<i32> = read_row_vec(&mut reader);
    let d = dxy[0];
    let x = dxy[1];
    let y = dxy[2];

    let a = f(d, x, y);

    println!("{}", if a { "Yes" } else { "No" });
}
