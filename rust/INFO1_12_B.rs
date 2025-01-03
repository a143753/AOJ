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

fn read_matrix<T: std::str::FromStr>(reader: &mut std::io::StdinLock, n: i32) -> Vec<Vec<T>>
where
    <T as std::str::FromStr>::Err: std::fmt::Debug,
{
    let mut matrix = Vec::new();
    reader.lines().take(n as usize).for_each(|line| {
        let dt = line
            .unwrap()
            .split_whitespace()
            .map(|x| x.parse::<T>().unwrap())
            .collect::<Vec<_>>();
        matrix.push(dt);
    });
    matrix
}

fn main() {
    let reader = std::io::stdin();

    let nm = read_row_vec::<i32>(&mut reader.lock());
    let n = nm[0];
    let _m = nm[1];

    let array = read_matrix::<i32>(&mut reader.lock(), n);

    let ij = read_matrix::<i32>(&mut reader.lock(), 2);
    let i1 = ij[0][0];
    let j1 = ij[0][1];
    let i2 = ij[1][0];
    let j2 = ij[1][1];

    (i1..=i2).for_each(|i| {
        (j1..=j2).for_each(|j| {
            print!("{} ", array[i as usize][j as usize]);
        });
        println!();
    });
}
