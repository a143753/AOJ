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

fn main() {
    let reader = std::io::stdin();
    let rc = read_row_vec::<usize>(&mut reader.lock());
    let r = rc[0];
    let c = rc[1];

    let mut matrix = read_matrix::<i32>(&mut reader.lock(), r);
    let mut sum = vec![0; c + 1];

    for i in 0..r {
        let mut row_sum = 0;
        for j in 0..c {
            row_sum += matrix[i][j];
            sum[j] += matrix[i][j];
        }
        matrix[i].push(row_sum);
    }
    for j in 0..c {
        sum[c] += sum[j]
    }
    matrix.push(sum);

    for i in 0..r + 1 {
        println!(
            "{}",
            matrix[i]
                .iter()
                .map(|x| x.to_string())
                .collect::<Vec<_>>()
                .join(" ")
        );
    }
}
