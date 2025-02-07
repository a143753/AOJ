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

fn main() {
    let reader = std::io::stdin();
    let i = read_row_vec::<i32>(&mut reader.lock());
    let a = i[0];
    let b = i[1];

    let s = 2 * a + 3 * b;
    println!("{}", s);
}
