defmodule G711u. do

  def handle_buffer(<<buffer::bitstring>>) do
    output = <<>>

    handle_buffer(buffer, output)
  end

  defp handle_buffer(<<sample::size(16), in_buff::bitstring>>, out_buff)
       when is_bitstring(out_buff) do
    output = <<(out_buff <> <<G7XX.Native.linear_to_ulaw(sample)::8>>)>>

    handle_buffer(in_buff, output)
  end

  defp handle_buffer(<<>>, out_buff) when is_bitstring(out_buff) do
    out_buff
  end

  def g711u_compress(sample) do
    # Convert the 16-bit signed sample to a 14-bit unsigned sample
    unsigned_sample = sample + 2**15

    # Apply the u-law companding function
    compressed_sample = u_law_compand(unsigned_sample)

    # Return the 8-bit compressed sample
    compressed_sample
  end

  def u_law_compand(sample) do
    # Compute the sign and magnitude of the sample
    sign = if sample < 2**13, do: 0, else: 1
    magnitude = abs(sample - 2**13)

    # Compute the compressed sample using the u-law companding function
    compressed_sample = (sign * 2**7) + (magnitude * 2**(7 - :math.log2(magnitude)))

    compressed_sample
  end

  def g711u_compress_buffer(buffer) do
    buffer
    |> binary_part(0, 16)
    |> Stream.map(&g711u_compress/1)
    |> Enum.map(&Integer.to_binary/2)
    |> Enum.map(&pad_leading/2)
    |> Enum.to_list()
  end

end
