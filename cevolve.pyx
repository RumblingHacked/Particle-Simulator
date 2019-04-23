import numpy as np

def c_evolve(r_i, ang_speed_i, timestep, nsteps):
    v_i = np.empty_like(r_i)

    for i in range(nsteps):
      norm_i = np.sqrt((r_i ** 2).sum(axis=1))

      v_i = r_i[:,[1,0]]
      v_i[:, 0] *= -1
      v_i /= norm_i[:, np.newaxis]

      d_i = timestep * ang_speed_i[:, np.newaxis] * v_i

      r_i += d_i
