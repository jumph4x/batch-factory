RSpec.shared_examples 'valid spreadsheet parser' do
  it 'should parse the data rows' do
    expect(rows[0]['age']).to eq 50
    expect(rows.size).to eq 1
  end
end

