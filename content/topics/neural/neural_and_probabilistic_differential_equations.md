---
title: Neural and Probabilistic Differential Equations
---

In recent year there has been an interest in solving Differential Equations using machine learning-based methods. The overall trend seems to be divided by the choice of model, of which there are two major contenders I have seen so far.

The first, and likely most popular, is the one that attemps to model the vector field of the differential equation as some neural network architecture.

The other, based on probabilistic numerics, attempts to obtain posterior probability distributions over the solution of the problem.

Let $\theta$ be a vector of some parameters. We want the solution of the equation

$$\frac{dy(t)}{dt} = f_{\theta}(t, y(t))$$

where $f_{\theta}$ is the vector field, parametrized by $\theta$.

In the neural side of the viewpoint, they take $f_{\theta}$ to be an universal approximator based on some neural-network architecture. This looks interesting at first glance, as we could in principle figure out in a deep-learning sense, the dynamics of a system. There is a close connection here as well to Physics-Informed Machine Learning.

Also of relevance, note the connection with Bayesian-PINNs [^1], where they use probabilistic priors for some if not all the parameters of the problem.

Alas, as far I have seen, all of these methods suffer from stringent data requirements, or computational costs. They are also relatively untapped for real-world applications, so there could be a chance for modern scientists and engineers to apply these techniques.

## Physics-Informed Gaussian Process

An alternative viewpoint was given by Pförtner et al [^2], where they proof using a Gaussian Process to solve a PDE by just using conditioning on partially-known physics, represented by uncertain boundary conditions and the equation itself, as well as noisy-data. This would provide, ideally, with a robust scientific model of learning under uncertainty. Since it is also a relatively new proposal, to my understanding this approach is not so easily encoded in any python module...

## Links

[Hennig, Philipp, Michael A. Osborne, and Hans P. Kersting. Probabilistic Numerics: Computation as Machine Learning. Cambridge University Press, 2022.](https://www.probabilistic-numerics.org/textbooks/): The book has a pdf version for personal use.

[Kidger, Patrick. "On neural differential equations." arXiv preprint arXiv:2202.02435 (2022).](https://arxiv.org/abs/2202.02435): Can also be found at the [university page](https://ora.ox.ac.uk/objects/uuid:af32d844-df84-4fdc-824d-44bebc3d7aa9)  

[probdiffeq](https://github.com/pnkraemer/probdiffeq): A JAX-based solver for probabilistic differential equations. 

[^1]: [Yang, Liu, Xuhui Meng, and George Em Karniadakis. "B-PINNs: Bayesian physics-informed neural networks for forward and inverse PDE problems with noisy data." Journal of Computational Physics 425 (2021): 109913.](https://arxiv.org/abs/2003.06097)

[^2]: [Pförtner, Marvin, et al. "Physics-informed Gaussian process regression generalizes linear PDE solvers." arXiv preprint arXiv:2212.12474 (2022).](http://arxiv.org/abs/2212.12474) 
