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

fn f(c: Vec<i32>) -> i32 {
    let mut r: Vec<i32> = [2, 2, 2, 2].to_vec();
    for i in 0..4 {
        let mut d = c.clone();
        d.remove(i);

        if d[0] == d[1] || d[1] == d[2] || d[2] == d[0] {
            r[i] = 1;
        }
    }
    if r == [1, 1, 1, 1] {
        return 1;
    } else if r == [2, 2, 2, 2] {
        return 2;
    } else {
        return 3;
    }
}

fn main() {
    let stdin = std::io::stdin();
    let mut reader = stdin.lock();

    let c = read_row_vec::<i32>(&mut reader);
    let a = f(c);
    println!("{}", a);
}
