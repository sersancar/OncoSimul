// use a multimap, or a map of a char and a vector? The second.  key is
// the mutation values: each of the freqs: 0 (appearance), 1, 5, 20, 50,
// 100%

// 0 is set when mutants are created.

// gral f(x): min_time_appearance(time, current_value) { if (time <
// current_value) time}

// current value is always initialized to +Inf when the entry for that
// gene is created. Doing the above "<" does not seem more costly than
// checking for a value or any other approach.

// remove_this
#include <Rcpp.h>
using namespace Rcpp;
// end_remove_this

#include <array>
#include <map>
#include <limits>


using std::vector;
using std::array;

constexpr double Infty = std::numeric_limits<double>::infinity();
constexpr int n_freqs_kept = 6; //0: apperance, 1: 1%, 2: 5%, 3: 20%; 4: 50%; 5: 100%
std::map<int, array<double, n_freqs_kept>> mutation_freq_at;


array<double, n_freqs_kept> mut_freq_init(double time) {
  // Yes, ugly as I hard-code the number of Infty.
  array<double, n_freqs_kept> out = {time, Infty, Infty, Infty, Infty, Infty};
  return out;
}

array<double, n_freqs_kept> mut_freq_update(double time, ) {
  // Yes, ugly as I hard-code the number of Infty.
  // Check present. If not, signal an error.
  array<double, n_freqs_kept> out = {time, Infty, Infty, Infty, Infty, Infty};
  return out;
}



void update_mutation_freqs(const vector<int>& newMutations,
			   int time,
			   std::map<int, array<double, n_freqs_kept>>& mfa) {
  for(auto const &m : newMutations)
    mfa[m] = mut_freq_init(time);
}

// at each pop update, update it

// At end, convert gene int names to names



// [[Rcpp::export]]
void f1() {
  vector<int> nm = {2, 7, 5};
  update_mutation_freqs(nm, 3.3, mutation_freq_at);
  for(auto const &ff: mutation_freq_at) {
    Rcpp::Rcout << " mutation " << ff.first << " with times ";
    for(auto const &tt :ff.second) {
      Rcpp::Rcout << tt << " ";
    }
    Rcpp::Rcout << std::endl;
  }
}
