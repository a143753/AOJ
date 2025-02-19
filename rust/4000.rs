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
    let stdin = std::io::stdin();
    let mut reader = stdin.lock();

    let pq = read_row_vec::<i32>(&mut reader);

    let p = pq[0];
    let q = pq[1];

    if (p + q) % 6 == 0 {
        println!("1");
    } else {
        println!("0");
    }
}
