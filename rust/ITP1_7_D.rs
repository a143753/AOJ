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
fn read_matrix<T: std::str::FromStr>(reader: &mut std::io::StdinLock, n: usize) -> Vec<Vec<T>>
where
    <T as std::str::FromStr>::Err: std::fmt::Debug,
{
    let mut matrix = Vec::new();
    reader.lines().take(n).for_each(|line| {
        let dt = line
            .unwrap()
            .split_whitespace()
            .map(|x| x.parse::<T>().unwrap())
            .collect::<Vec<_>>();
        matrix.push(dt);
    });
    matrix
}

fn f(m1: &Vec<Vec<i64>>, m2: &Vec<Vec<i64>>) -> Vec<Vec<i64>> {
    let mut m3 = vec![vec![0; m2[0].len()]; m1.len()];

    for i in 0..m1.len() {
        for j in 0..m2[0].len() {
            for k in 0..m1[0].len() {
                m3[i][j] += m1[i][k] * m2[k][j];
            }
        }
    }
    m3
}

fn main() {
    let reader = std::io::stdin();
    let nml = read_row_vec::<usize>(&mut reader.lock());
    let n = nml[0];
    let m = nml[1];
    let _l = nml[2];

    let m1 = read_matrix::<i64>(&mut reader.lock(), n);
    let m2 = read_matrix::<i64>(&mut reader.lock(), m);

    let m3 = f(&m1, &m2);

    println!(
        "{}",
        m3.iter()
            .map(|x| x
                .iter()
                .map(|y| y.to_string())
                .collect::<Vec<_>>()
                .join(" "))
            .collect::<Vec<_>>()
            .join("\n")
    );
}
